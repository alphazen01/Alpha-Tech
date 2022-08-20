import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
    Key? key,
    required this.title,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);
   String title;
   double? fontSize;
   Color? color;
   FontWeight?fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}