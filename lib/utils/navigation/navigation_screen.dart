import 'package:alpha/controller/products_controller.dart';
import 'package:alpha/models/products_model.dart';
import 'package:alpha/utils/constant/loading.dart';
import 'package:alpha/utils/constant/theme.dart';

import 'package:alpha/view/home/home_screen.dart';
import 'package:alpha/view/profile/profile_view.dart';
import 'package:alpha/view/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constant/function/nav_container.dart';

class NavigationScreen extends StatefulWidget {
  int? selectedItem;
  NavigationScreen({Key? key, required this.selectedItem}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> screens = [HomeScreen(), SearchView(), ProfileView()];
  Loading load = Loading();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(widget.selectedItem ?? 0),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: widget.selectedItem == 0
                  ? NavContainer(
                    title: "Home",
                    icon: Icons.home
                  )
                  : Icon(Icons.home),
              label: ""),
          BottomNavigationBarItem(
              icon: widget.selectedItem == 1
                  ? NavContainer(
                    title: "Search",
                    icon: Icons.search
                  )
                  : Icon(Icons.search),
              label: ""),
          BottomNavigationBarItem(
              icon: widget.selectedItem == 2
                  ? NavContainer(
                    title: "Profile",
                    icon: Icons.person
                  )
                  : Icon(Icons.person),
              label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedItem!,
        backgroundColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            widget.selectedItem = index;
          });
        },
      ),
    );
  }

} 
