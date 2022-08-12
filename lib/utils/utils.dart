import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:io' show Platform;


var logger = Logger();



bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

bool isAndroid() {
  if (Platform.isAndroid) {
    return true;
  }
  return false;
}

bool isIOS() {
  if (Platform.isIOS) {
    return true;
  }
  return false;
}


class FutureAPIBuilder<T> extends StatelessWidget {
  static bool isReturned = false;
  final Future<T>? future;
  final AsyncWidgetBuilder<T>? initialData;
  Function? errorCallBack;
  Function? noInternetCallBack;
  final builder;
  FutureAPIBuilder(
      {Key? key,
        this.future,
        this.initialData,
        this.errorCallBack,
        required this.builder,
        this.noInternetCallBack})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      key: key,
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        // check if auth error has occured
        if(snapshot.connectionState == ConnectionState.done && snapshot.error != null){
         /// Todo we will check token in each call & if token expire will force user logout
        }
        return builder(context, snapshot);
      },
    );
  }

}