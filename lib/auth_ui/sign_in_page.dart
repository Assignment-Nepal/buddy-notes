import 'dart:math';

import 'package:buddyapp/auth_ui/sign_in_view_model.dart';
import 'package:buddyapp/auth_ui/top_level_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/alert_dailog.dart';
import 'constants/keys.dart';
import 'constants/strings.dart';
import '../widget/custom_button.dart';
import 'email_password_sign_in_page.dart';


final signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
  (ref) => SignInViewModel(auth: ref.watch(firebaseAuthProvider)),
);

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInModel = ref.watch(signInModelProvider);
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    ref.listen<SignInViewModel>(signInModelProvider, (_, model) async {
      if (model.error != null) {
        await showExceptionAlertDialog(
          context: context,
          title: "Sign in failed",
          exception: model.error,
        );
      }
    });
    return SignInPageContents(
      viewModel: signInModel,
      firebaseAuth: firebaseAuth
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents(
      {Key? key, required this.viewModel,required this.firebaseAuth})
      : super(key: key);
  final SignInViewModel viewModel;
  final FirebaseAuth firebaseAuth;


  static const Key emailPasswordButtonKey = Key(Keys.emailPassword);
  static const Key anonymousButtonKey = Key(Keys.anonymous);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      "Sign in",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: min(constraints.maxWidth, 600),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 32.0),
              SizedBox(
                height: 50.0,
                child: _buildHeader(),
              ),
              const SizedBox(height: 32.0),
              SignInButton(
                key: emailPasswordButtonKey,
                text: Strings.signInWithEmailPassword,
                onPressed: viewModel.isLoading
                    ? null
                    : (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  EmailPasswordSignInPage.withFirebaseAuth(firebaseAuth,
                        onSignedIn:(){
                          Navigator.pop(context);
                        });
                  }));
                },
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              const Text(
                Strings.or,
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              SignInButton(
                key: anonymousButtonKey,
                text: Strings.goAnonymous,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInAnonymously,
              ),
            ],
          ),
        );
      }),
    );
  }
}
