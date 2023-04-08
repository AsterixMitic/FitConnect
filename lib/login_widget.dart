import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'main.dart';

class LoginWidget extends StatefulWidget{

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(height: 40),
            ElevatedButton(
              
              onPressed: logIn, 
              child: Text("Log in"),
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: 'Dont have acc? ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                    text: 'Sign up!',
                    style: TextStyle(
                      color: Colors.blue,
                    )
                  )
                ]
              )
            )
          ],
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
      

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
        );
    } on FirebaseAuthException catch(e){
      print(e);
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    
  }

}