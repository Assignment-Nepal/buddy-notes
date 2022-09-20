

import 'package:flutter/material.dart';
import 'package:safar_frontend/auth/sign_in.dart';
import 'package:safar_frontend/home/home.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    String? path = settings.name;
    print(path);

    if(path == null){
      _errorRoute(settings);
    }

    // extract path parameters

    switch(path){

      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context){
              return const SignIN();
            }
        );

      case 'Home':
        BottomTab? bottomTab = settings.arguments as BottomTab?;
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context){
              return HomeRoute(
                selectedBottomTab: bottomTab,
              );
            }
        );


      default:
      // if there is no such named route, return error route
        return _errorRoute(settings);
    }

  }

  static Route<dynamic> _errorRoute(RouteSettings settings){

    return MaterialPageRoute(
        builder: (_){
          return const ErrorPage();
        }
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
