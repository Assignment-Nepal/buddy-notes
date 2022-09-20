

import 'package:flutter/material.dart';
import 'package:safar_frontend/home/home.dart';
import 'package:safar_frontend/utils/utils.dart';




class DynamicNavigationService {


  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(Uri uri,{Map<String,dynamic>?messageData}) async {

    print("Uri = $uri");
    List<String> pathSegments = uri.pathSegments;

    print("path seg = $pathSegments");

    Map<String,String> queryParams = uri.queryParameters;


    if(pathSegments.length == 0) {
      // No Notification path specified
      return navigatorKey.currentState!.pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);

    } else if(pathSegments.length == 1) {
      // 1 Level notification

      String path = pathSegments[0];
      switch(path) {

        case 'Home':
          logger.d("FCM > Home");
          return navigatorKey.currentState!.pushNamedAndRemoveUntil("Home", (Route<dynamic> route) => false, arguments: BottomTab.Home);


        default:
          logger.d("FCM > Default");
          return navigatorKey.currentState!.pushNamedAndRemoveUntil("Home", (Route<dynamic> route) => false, arguments: BottomTab.Home);
      }
    }

    // Default route
    return navigatorKey.currentState!.pushNamedAndRemoveUntil("Home", (Route<dynamic> route) => false, arguments: BottomTab.Home);
  }

}