
import 'package:buddy_web/utils/utils.dart';
import 'package:dio/dio.dart';

class HttpMiddleware {
  Dio dio =  Dio();

  Future<Dio> getHttpClient(baseUrl,{responseSerializer, cache = false, cacheAgeMin = 15}) async {
    var accessToken = "";//getAccessToken();
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 60000; //60s
    dio.options.receiveTimeout = 60000;


    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options,RequestInterceptorHandler handler) async {
          // Do something before request is sent
          print("token for opn $accessToken");
          // Do something before request is sent
          String requestUrl = options.baseUrl + options.path;
          logger.d(requestUrl);
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);  //continue
        },
        onResponse:(Response<dynamic> response,ResponseInterceptorHandler handler) async {
          // Do something with response data



          return handler.next(response);// continue
        },
        onError: (DioError error,ErrorInterceptorHandler handler) async {
          // Do something with response error
          ///Todo when we will save refresh token to make user force login


          return  handler.next(error);//continue
        }
    ));
    return dio;
  }
}