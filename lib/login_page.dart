import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
   
  Widget build(BuildContext context) {
    

    return Scaffold(
     backgroundColor: Colors.white,
     body:LoginWidget(loginimg: AssetImage("images/loginimg.png"),),
    );
  }
}