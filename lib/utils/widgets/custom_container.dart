import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  
   CustomContainer({
    Key? key,
   required this.title,
   this.width,
   this.height,
  required this.radius,
   this.textColor,
   this.icon,
   this.iconColor,
   this.color,
  }) : super(key: key);
  String title;
  double? width;
  double? height;
  double radius;
  IconData?icon;
  Color?iconColor;
  Color?color;
  Color?textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 5,),
          Text(
            "$title",
            style: TextStyle(
             color: textColor
              
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}