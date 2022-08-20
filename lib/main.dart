import 'package:alpha/auth/log_in.dart';
import 'package:alpha/auth/sign_up.dart';
import 'package:alpha/controller/auth_controller.dart';
import 'package:alpha/controller/cart_controller.dart';
import 'package:alpha/controller/products_controller.dart';
import 'package:alpha/models/products_model.dart';
import 'package:alpha/utils/navigation/navigation_class.dart';
import 'package:alpha/utils/navigation/navigation_screen.dart';
import 'package:alpha/utils/services/dio_services.dart';
import 'package:alpha/utils/services/share_prefer_services.dart';
import 'package:alpha/view/home/home_screen.dart';
import 'package:alpha/view/products/cart.dart';
import 'package:alpha/view/products/details_screen.dart';
import 'package:alpha/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState>? navKey = GlobalKey();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsController>(
            create: (context) => ProductsController()),
        ChangeNotifierProvider<AuthController>(
            create: (context) => AuthController()),
            ChangeNotifierProvider<CartController>(
            create: (context) => CartController()),
      ],
      child: CustomApp(),
    );
  }
}

class CustomApp extends StatelessWidget {
  const CustomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.redAccent,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.redAccent,
            elevation: 0
          ),
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen()
      );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    DioSingleton.instance.create();
    SharedPreferencesService.instance.create();
SharedPreferencesService.instance.getBool("loggedIn").then((bool value) {
  if (value==true) {
    SharedPreferencesService.instance.getString('email').then((email) {
      SharedPreferencesService.instance.getString('password').then((passs) {
navKey!.currentContext!.read<AuthController>().loginUser(
  context: context,
  userEmail: email, userPassword: passs);
  
      } );
    });
    
  } else {
    Navigator.pushReplacement(context,  MaterialPageRoute(
    builder: (_) => LoginScreen()));
  }
});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

