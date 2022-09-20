import 'dart:async';
import 'dart:convert';
import 'package:buddy_web/network_layer/endponit.dart';
import 'package:buddy_web/network_layer/error.dart';
import 'package:buddy_web/network_layer/middleware.dart';
import 'package:buddy_web/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';



typedef ResponseSerializer = dynamic Function(Map<String, dynamic> json);

Future getHttpServiceFuture(String requestUrl, responseSerializer,
    {Map<String, String?>? queryParams, bool enableCache: false, String? authority, returnRaw: false, int cacheMaxMin: 15}) async {

  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response? httpResponse;
  DioError? dioError;

  authority ??= Api.authority;
  logger.d(authority);

  try {
    Dio http = await httpMiddleware.getHttpClient(authority, cache: enableCache);
    httpResponse = await http.get(requestUrl, queryParameters: queryParams,
        options: enableCache? buildCacheOptions(Duration(minutes: cacheMaxMin)): null);

  } on DioError catch (error) {
    dioError = error;
    if (error.response != null) {
      httpResponse = error.response;
    }

    if (error.error is ApiError) {
      return Future.error(error.error);
    } else {
      ///Todo when we will add sentry or Crashlytics
      // logCrashlyticsDioError(error);
      // reportDioErrorToSentry(error);
    }
  }


  if (httpResponse != null && httpResponse.data != null) {

    bool isJson = false;
    if (httpResponse.headers != null) {
      isJson = (httpResponse.headers['content-type'] != null) && httpResponse.headers['content-type']!.contains('application/json');
    }

    int? httpStatusCode = httpResponse.statusCode;
    var responseJson = httpResponse.data, responseObject;

    if(returnRaw){
      return {'responseJson': responseJson,'httpStatusCode': httpStatusCode};
    }

    if (isJson) {
      try {
        responseObject = responseSerializer(responseJson);

      } catch (error, stackTrace) {
        // Error HTTP Code 5XX
        serviceErrorLogger(error, stackTrace);
        return Future.error(ApiError(0));
      }
    }

    if (isJson && responseObject != null) {
      if (httpStatusCode == 200 && responseObject.status == "success") {
        return responseObject;
      }
      return Future.error(
          ApiError(
              httpStatusCode,
              dioError!.message, dioError.type,
              responseObject.status, responseObject.msg,
              responseObject.error_code, responseObject.error_data
          )
      );
    }

    return Future.error(
        ApiError(
            httpStatusCode,
            dioError!.message, dioError.type,
            httpResponse.statusMessage, httpResponse.data.toString()
        )
    );
  }

  if (dioError != null) {
    return Future.error(ApiError(0, dioError.message, dioError.type));
  }
  return Future.error(ApiError(0));
}


Future postHttpServiceFuture(String requestUrl, responseSerializer,
    {Map<String, String?>? queryParams, Map? postData,
      bool enableCache: false, String? authority, returnRaw: false, isForm: false, int cacheMaxMin: 15}) async {

  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response? httpResponse;
  DioError? dioError;
  var encodedBody;
  if (!isForm) {
    encodedBody = json.encode(postData);
  } else {
    encodedBody = FormData.fromMap(postData as Map<String, dynamic>);
  }

  authority ??= Api.authority;
  logger.d(authority);

  try {
    Dio http = await httpMiddleware.getHttpClient(authority, cache: enableCache);
    httpResponse = await http.post(requestUrl, data: encodedBody, queryParameters: queryParams,
        options: enableCache? buildCacheOptions(Duration(minutes: cacheMaxMin)): null);

  } on DioError catch (error, stackTrace) {
    dioError = error;
    serviceErrorLogger(error, stackTrace);
    if (dioError.response != null) {
      httpResponse = dioError.response;
    }
    if (error.error is ApiError) {
      return Future.error(error.error);
    }
  }

  if (httpResponse != null && httpResponse.data != null) {

    bool isJson = false;
    if (httpResponse.headers != null) {
      isJson = (httpResponse.headers['content-type'] != null) && httpResponse.headers['content-type']!.contains('application/json');
    }

    int? httpStatusCode = httpResponse.statusCode;
    var responseJson = httpResponse.data, responseObject;

    if(returnRaw){
      return {'responseJson': responseJson,'httpStatusCode': httpStatusCode};
    }

    if (isJson) {
      try {
        responseObject = responseSerializer(responseJson);
      } catch (error, stackTrace) {
        serviceErrorLogger(error, stackTrace);
        return Future.error(ApiError(0));
      }
    }

    if (isJson && responseObject != null) {
      if (httpStatusCode == 200 && responseObject.status == "success") {
        return responseObject;
      }
      return Future.error(
          ApiError(
              httpStatusCode,
              dioError!.message, dioError.type,
              responseObject.status, responseObject.msg,
              responseObject.error_code, responseObject.error_data
          )
      );
    }

    return Future.error(
        ApiError(
            httpStatusCode,
            dioError!.message, dioError.type,
            httpResponse.statusMessage, httpResponse.data.toString()
        )
    );
  }

  if (dioError != null) {
    logger.e("Dio Error is null");
    return Future.error(ApiError(0, dioError.message, dioError.type));
  }
  return Future.error(ApiError(0));
}

Future putHttpServiceFuture(String requestUrl, responseSerializer,
    {Map<String, String>? queryParams, Map? postData,
      bool enableCache: false, String? authority, returnRaw: false}) async {

  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response? httpResponse;
  DioError? dioError;
  String encodedBody = json.encode(postData);

  authority ??= Api.authority;
  logger.d(authority);

  try {
    Dio http = await httpMiddleware.getHttpClient(authority);
    httpResponse = await http.put(requestUrl, data: encodedBody, queryParameters: queryParams);

  } on DioError catch (error, stackTrace) {
    dioError = error;
    serviceErrorLogger(error, stackTrace);
    if (dioError.response != null) {
      httpResponse = dioError.response;
    }
    if (error.error is ApiError) {
      return Future.error(error.error);
    }
  }

  if (httpResponse != null && httpResponse.data != null) {

    bool isJson = false;
    if (httpResponse.headers != null) {
      isJson = (httpResponse.headers['content-type'] != null) && httpResponse.headers['content-type']!.contains('application/json');
    }

    int? httpStatusCode = httpResponse.statusCode;
    var responseJson = httpResponse.data, responseObject;

    if(returnRaw){
      return {'responseJson': responseJson,'httpStatusCode': httpStatusCode};
    }

    if (isJson) {
      try {
        responseObject = responseSerializer(responseJson);
      } catch (error, stackTrace) {
        serviceErrorLogger(error, stackTrace);
        return Future.error(ApiError(0));
      }
    }

    if (isJson && responseObject != null) {
      if (httpStatusCode == 200 && responseObject.status == "success") {
        return responseObject;
      }
      return Future.error(
          ApiError(
              httpStatusCode,
              dioError!.message, dioError.type,
              responseObject.status, responseObject.msg,
              responseObject.error_code, responseObject.error_data
          )
      );
    }

    return Future.error(
        ApiError(
            httpStatusCode,
            dioError!.message, dioError.type,
            httpResponse.statusMessage, httpResponse.data.toString()
        )
    );
  }

  if (dioError != null) {
    logger.e("Dio Error is null");
    return Future.error(ApiError(0, dioError.message, dioError.type));
  }
  return Future.error(ApiError(0));
}

Future patchHttpServiceFuture(String requestUrl, responseSerializer,
    {Map<String, String>? queryParams, Map? postData,
      bool enableCache: false, String? authority, returnRaw: false}) async {

  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response? httpResponse;
  DioError? dioError;
  String encodedBody = json.encode(postData);

  authority ??= Api.authority;
  logger.d(authority);

  try {
    Dio http = await httpMiddleware.getHttpClient(authority);
    httpResponse = await http.patch(requestUrl, data: encodedBody, queryParameters: queryParams);

  } on DioError catch (error, stackTrace) {
    dioError = error;
    serviceErrorLogger(error, stackTrace);
    if (dioError.response != null) {
      httpResponse = dioError.response;
    }
    if (error.error is ApiError) {
      return Future.error(error.error);
    }
  }

  if (httpResponse != null && httpResponse.data != null) {

    bool isJson = false;
    if (httpResponse.headers != null) {
      isJson = (httpResponse.headers['content-type'] != null) && httpResponse.headers['content-type']!.contains('application/json');
    }

    int? httpStatusCode = httpResponse.statusCode;
    var responseJson = httpResponse.data, responseObject;

    if(returnRaw){
      return {'responseJson': responseJson,'httpStatusCode': httpStatusCode};
    }

    if (isJson) {
      try {
        responseObject = responseSerializer(responseJson);
      } catch (error, stackTrace) {
        serviceErrorLogger(error, stackTrace);
        return Future.error(ApiError(0));
      }
    }

    if (isJson && responseObject != null) {
      if (httpStatusCode == 200 && responseObject.status == "success") {
        return responseObject;
      }
      return Future.error(
          ApiError(
              httpStatusCode,
              dioError!.message, dioError.type,
              responseObject.status, responseObject.msg,
              responseObject.error_code, responseObject.error_data
          )
      );
    }

    return Future.error(
        ApiError(
            httpStatusCode,
            dioError!.message, dioError.type,
            httpResponse.statusMessage, httpResponse.data.toString()
        )
    );
  }

  if (dioError != null) {
    logger.e("Dio Error is null");
    return Future.error(ApiError(0, dioError.message, dioError.type));
  }
  return Future.error(ApiError(0));
}

Future deleteHttpServiceFuture(String requestUrl, responseSerializer,
    {Map<String, String>? queryParams, Map? postData,
      bool enableCache: false, String? authority, returnRaw: false}) async {

  HttpMiddleware httpMiddleware = HttpMiddleware();
  Response? httpResponse;
  DioError? dioError;
  String encodedBody = json.encode(postData);

  authority ??= Api.authority;
  logger.d(authority);

  try {
    Dio http = await httpMiddleware.getHttpClient(authority);
    httpResponse = await http.delete(requestUrl, data: encodedBody, queryParameters: queryParams);

  } on DioError catch (error, stackTrace) {
    dioError = error;
    serviceErrorLogger(error, stackTrace);
    if (dioError.response != null) {
      httpResponse = dioError.response;
    }
    if (error.error is ApiError) {
      return Future.error(error.error);
    }
  }

  if (httpResponse != null && httpResponse.data != null) {

    bool isJson = false;
    if (httpResponse.headers != null) {
      isJson = (httpResponse.headers['content-type'] != null) && httpResponse.headers['content-type']!.contains('application/json');
    }

    int? httpStatusCode = httpResponse.statusCode;
    var responseJson = httpResponse.data, responseObject;

    if(returnRaw){
      return {'responseJson': responseJson,'httpStatusCode': httpStatusCode};
    }

    if (isJson) {
      try {
        responseObject = responseSerializer(responseJson);
      } catch (error, stackTrace) {
        serviceErrorLogger(error, stackTrace);
        return Future.error(ApiError(0));
      }
    }

    if (isJson && responseObject != null) {
      if (httpStatusCode == 200 && responseObject.status == "success") {
        return responseObject;
      }
      return Future.error(
          ApiError(
              httpStatusCode,
              dioError!.message, dioError.type,
              responseObject.status, responseObject.msg,
              responseObject.error_code, responseObject.error_data
          )
      );
    }

    return Future.error(
        ApiError(
            httpStatusCode,
            dioError!.message, dioError.type,
            httpResponse.statusMessage, httpResponse.data.toString()
        )
    );
  }

  if (dioError != null) {
    logger.e("Dio Error is null");
    return Future.error(ApiError(0, dioError.message, dioError.type));
  }
  return Future.error(ApiError(0));
}

void serviceErrorLogger(error, stackTrace) {
  List<String> ignoreErrorCodes = ["INVALID_TOKEN", "EXPIRED_REFRESH_TOKEN"];
  if (error is ApiError && error.errorCode != null &&
      ignoreErrorCodes.contains(error.errorCode)) {
    logger.w(error);
  } else {
    // logCrashlyticsError(error, stacktrace: stackTrace);
    // reportErrorToSentry(error, stacktrace: stackTrace);

  }
}