
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'models/user.dart';

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
      backgroundColor: Colors.white,
      body: 
         BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
           child: Container
           (
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
              padding: EdgeInsets.only(left: 20,right: 20),
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
                  height: 170,
                ),
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
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Enter your password"),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    
                    onPressed: signIn, 
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text("Sign in")),
                  ),
                  SizedBox(height: 60),
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
           ),
         ),
      
    );
  }

  Future signIn() async {

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
        );
      Client u = Client(email: emailController.text.trim(), picture: "https://firebasestorage.googleapis.com/v0/b/fitconnect-38ef3.appspot.com/o/user_image%20%2FprofileIcon.png?alt=media&token=3008631f-f6ac-4302-86c5-c510508a5eb6");
      Database(uid: FirebaseAuth.instance.currentUser!.uid).updateUserData(u);
    } on FirebaseAuthException catch(e){
      print(e);
    }
    
  }

}