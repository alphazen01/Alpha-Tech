import 'package:alpha/utils/widgets/custom_container.dart';
import 'package:flutter/material.dart';

import '../constant/theme.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    Key? key,
    required this.title,
    this.hintTitle,
    required this.prefixIcon,
    this.suffixIcon,
    this.type,
    required this.obscureText,
    required this.readOnly,
    required this.controller,
  }) : super(key: key);
String title;
String? hintTitle;
IconData prefixIcon;
Widget? suffixIcon;
bool obscureText=false;
bool readOnly = false;
TextEditingController controller;
TextInputType? type;
  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 2,
      child: TextField(
        keyboardType:type,
        controller:controller ,
        readOnly: readOnly,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText:hintTitle ,
          labelText: "$title",
          labelStyle: TextStyle(
            color: PTheme.textColor
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: PTheme.paddingX),
            child: CustomContainer(
            width: 0,
            height: 0,
            title: "",
            icon: prefixIcon,
            iconColor:PTheme.iconColor ,
            radius: PTheme.buttonShape,
            color: PTheme.textColor,
            textColor:PTheme.textColor2 ,
            ),
          ),
          suffixIcon:suffixIcon ,
          border: InputBorder.none
        ),
      ),
    );
  }
}

