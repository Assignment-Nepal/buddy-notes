import 'dart:async';

import 'package:buddyapp/widget/alert_dailog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({required this.auth});
  final FirebaseAuth auth;
  bool isLoading = false;
  dynamic error;


  Future<void> signInAnonymously() async {
    try {
      isLoading = true;
      notifyListeners();
     await signInMethod();
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<UserCredential> signInMethod(){
    return auth.signInAnonymously();
  }

 /// Todo will add this wherever we make logout button
  Future<void> _confirmSignOut(
      BuildContext context, FirebaseAuth firebaseAuth) async {
    final bool didRequestSignOut = await showAlertDialog(
      context: context,
      title: Strings.logout,
      content: Strings.logoutAreYouSure,
      cancelActionText: Strings.cancel,
      defaultActionText: Strings.logout,
    ) ??
        false;
    if (didRequestSignOut == true) {
      await signOut(context);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: Strings.logoutFailed,
        exception: e,
      ));
    }
  }
}

