import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:buddyapp/utils/utils.dart';
import 'package:buddyapp/widget/auth_widget.dart';
import 'package:buddyapp/widget/material_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_ui/sign_in_page.dart';
import 'home/home_view.dart';



/// Requires that a Firestore emulator is running locally.
/// See https://firebase.flutter.dev/docs/firestore/usage#emulator-usage
bool shouldUseFirestoreEmulator = false;

void main() {
  mainDelegate();
}

void mainDelegate() async {

  WidgetsFlutterBinding.ensureInitialized();

  /// Wait for Firebase to initialize
  /// ref: https://firebase.flutter.dev/docs/overview
  await Firebase.initializeApp();

  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
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

  /// errors that happen outside of the Flutter context, install an error listener on the current Isolate
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);

  // Errors will never cross error-zone boundaries by themselves.
  // Errors that try to cross error-zone boundaries are considered uncaught in their originating error zone.
  //
  // More about zones:
  // - https://api.flutter.dev/flutter/dart-async/runZonedGuarded.html

  runZonedGuarded<Future<void>>(() async {
    runApp( ProviderScope(
      child: MyApp(),
    ));
  }, (error, stackTrace) {

    FirebaseCrashlytics.instance.recordError(error, stackTrace);

    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    try {
      /// TOdo when we will add sentry then will send all the error to sentry from here
    } catch (e) {
      logger.e(e);
    }
  });

}


class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MaterialColor primarySwatch = MaterialColor(0xFF024A9F, InToMaterialColors.color);
    return MaterialApp(
      theme: ThemeData(primarySwatch: primarySwatch,primaryColor: primarySwatch),
      debugShowCheckedModeBanner: false,
      home:  AuthWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (context, ref, _) {
            return  const HomeRoute();
          },
        ),
        signedInBuilder: (_) =>  const HomeRoute(),
      ),

    );
  }
}


