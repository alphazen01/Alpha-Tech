import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.radius,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.color,

  }) : super(key: key);
  String title;
  VoidCallback onTap;
  double?fontSize;
  double radius;
  FontWeight?fontWeight;
  Color?textColor;
  Color?color;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onTap, 
    child: Text(
    "$title",
    style: TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: textColor
    ),
    ),
    style: ElevatedButton.styleFrom(
    primary: color,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius)
    )
    ),
    );
  }
}
