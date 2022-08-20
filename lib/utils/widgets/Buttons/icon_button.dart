import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
   CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color,
    this.size,
  }) : super(key: key);
  IconData icon;
  double? size;
  Color? color;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: IconButton(
          onPressed:onTap, 
          icon: Icon(
          icon,
          size:size,
          color: color,
        ),
          
          
        ),
      ),
    );
  }
}