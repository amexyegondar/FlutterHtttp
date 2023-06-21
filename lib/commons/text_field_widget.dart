import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({super.key,required this.controller});
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     controller: controller,
     
     decoration: InputDecoration(
    
     ),
    );
  }
}