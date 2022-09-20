import 'dart:async';
import 'dart:isolate';

import 'package:buddy_web/route/route.dart';
import 'package:buddy_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:routemaster/routemaster.dart';

import 'config/config.dart';

void main() {
  Config.setEnvironment(env: Env.PROD);
  mainDelegate();
}


void mainDelegate() async {

  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );

  WidgetsFlutterBinding.ensureInitialized();


  /// register global error handler
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // FirebaseCrashlytics.instance.recordFlutterError;
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };


  // Errors will never cross error-zone boundaries by themselves.
  // Errors that try to cross error-zone boundaries are considered uncaught in their originating error zone.
  //
  // More about zones:
  // - https://api.flutter.dev/flutter/dart-async/runZonedGuarded.html

  runZonedGuarded<Future<void>>(() async {
    runApp( MaterialApp.router(
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
    ),);
  }, (error, stackTrace) {

    // FirebaseCrashlytics.instance.recordError(error, stackTrace);

    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    try {
      /// TOdo when we will add sentry then will send all the error to sentry from here
    } catch (e) {
      logger.e(e);
    }
  });

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) {

          return Scaffold(body: Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                Routemaster.of(context).push('/home/2');
              },
                child: const Text("Please open in Desktop")),
          ));
        },
        tablet: (BuildContext context) {

          return Scaffold(body: Container(
            alignment: Alignment.center,
            child: Text("Please open in Desktop",style: TextStyle(fontSize: 18.sp),),
          ));
        },
        desktop: (BuildContext context) {
          return Container();
        },

      )
    );
  }
}

