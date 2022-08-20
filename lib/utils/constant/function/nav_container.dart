 import 'package:flutter/material.dart';

import '../theme.dart';

Container NavContainer({required IconData icon, required String title}) {
    return Container(
      width: 100,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: PTheme.navigationIconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "$title",
            style: TextStyle(color: PTheme.textColor3),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: PTheme.navigationColor,
          borderRadius: BorderRadius.circular(PTheme.buttonShape)),
    );
  }
