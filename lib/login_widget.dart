import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xCC6BFE9F),
              Color(0xCC35b1b5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30,right: 100),
                      child: Text(
                                      "Welcome to FitConnect",
                                      
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                    )),
                SizedBox(
                  height: 200,
                ),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: "Enter your email"),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: passwordController,
                  cursorColor: Colors.white,  
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: "Enter your password"),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: logIn,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    
                    child: Text("Log in")),
                ),
                SizedBox(height: 40),
                RichText(
                    text: TextSpan(text: "Don't have account? ", children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign up!',
                      style: TextStyle(
                        color: Colors.blue,
                      ))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future logIn() async {
    /*
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator())
      );
      */

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
