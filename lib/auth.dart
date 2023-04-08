import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_widget.dart';
import 'signin_widget.dart';

class AuthPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AuthPageState();

}

class _AuthPageState extends State<AuthPage>{

  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
       ? LoginWidget(onClickedSignUp: toggle)
       : SigninWidget(onClickedSignUp: toggle);

   void toggle() => setState(() => isLogin = !isLogin);

}