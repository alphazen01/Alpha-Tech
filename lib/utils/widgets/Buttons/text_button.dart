import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);
   String title;
  VoidCallback onTap;
  double?fontSize;
  FontWeight?fontWeight;
  Color?color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: onTap, 
    child: Text(
    "$title",
    style: TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight
    ),
    )
    );
  }
}