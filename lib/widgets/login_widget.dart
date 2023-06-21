import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_auth_page/commons/text_field_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key,required this.loginimg});
   final AssetImage loginimg;
  @override
  Widget build(BuildContext context) {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Column(
      children:[
        Container(
          width: w,
          height: h*0.3,
       decoration:BoxDecoration(
        image:DecorationImage(
          image: loginimg,
          fit: BoxFit.cover,
       ),
        )),
        Text("HELLO", 
        style:TextStyle(
          fontSize: 30,
        )),
        Text("Sign in to your account"),
        TextFieldWidget(controller: emailController),
        TextFieldWidget(controller: passwordController),

      ],
     );
  }
}