import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../../view/products/cart.dart';
import '../../navigation/navigation_screen.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../theme.dart';

Column CustomDrawer() {
  return Column(
    children: [
      CustomText(
        title: "Collections",
        fontSize: 20,
      ),
      Expanded(
        child: ListView.separated(
          itemCount: drawerItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(
                drawerItems[index].icon,
              ),
              title: CustomText(title: drawerItems[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => drawerItems[index].screen!),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
            );
          },
        ),
      ),
      ListTile(
        title: Consumer<AuthController>(
          builder: ((context, authController, child) => CustomButton(
              title: "Logout",
              fontSize: 16,
              textColor: PTheme.textColor3,
              
              onTap: () {
                authController.logoutUser(context: context);
              },
              radius: 10,
              color: PTheme.buttonColor)),
        ),
      )
    ],
  );
}

class DrawerList {
  DrawerList(
      {required this.title,
      required this.icon,
      required this.screen,
      this.logout});

  String title;
  IconData icon;
  Widget? screen;
  Widget? logout;
}

List<DrawerList> drawerItems = [
  DrawerList(
      title: "Cart Screen",
      icon: Icons.person,
      screen:CartScreen()
      ),
  DrawerList(
      title: "Profile",
      icon: Icons.person,
      screen: NavigationScreen(selectedItem: 2)
      ),
  DrawerList(
      title: "Web Links",
      icon: Icons.person,
      screen: NavigationScreen(selectedItem: 1)
      ),
];
