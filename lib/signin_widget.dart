
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class SigninWidget extends StatefulWidget{

  final VoidCallback onClickedSignUp;

  const SigninWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninWidget> {
  
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
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Enter your email"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) => 
                email != null && !EmailValidator.validate(email) ?
                'Enter valid email!'
                : null,

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
              
              onPressed: signIn, 
              child: Text("Sign in"),
            ),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: 'Already have acc? ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                    text: 'Log in!',
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

  Future signIn() async {

    /*showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator())
      );
      */
      

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
        );
    } on FirebaseAuthException catch(e){
      print(e);
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    
  }

}