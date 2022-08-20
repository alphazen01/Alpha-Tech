import 'package:alpha/auth/sign_up.dart';
import 'package:alpha/utils/constant/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import '../controller/auth_controller.dart';
import '../utils/constant/theme.dart';
import '../utils/widgets/Buttons/custom_button.dart';
import '../utils/widgets/Buttons/text_button.dart';
import '../utils/widgets/custom_text.dart';
import '../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: PTheme.paddingX),
                child: CustomText(
                  title: "Log In",
                  fontSize: 24,
                  color: PTheme.textColor3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: PTheme.paddingX, vertical: PTheme.paddingY),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                          title: "Welcome Back",
                          color: PTheme.textColor,
                          fontSize: 24,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: "Glad to see you back my budy",
                          color: PTheme.textColor2,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        CustomTextField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            readOnly: false,
                            obscureText: false,
                            title: "Email",
                            prefixIcon: Icons.mail_outline),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          obscureText: !isTap,
                          readOnly: false,
                          title: "Password",
                          prefixIcon: Icons.lock,
                          suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(isTap
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Consumer<AuthController>(
                      builder: (context, authController, child) {
                        return 
                        authController.loginDataState==DataState.loading?
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ):
                        SizedBox(
                          width: double.infinity,
                          height:60,
                          child: CustomButton(
                            title: "LogIn",
                            color: PTheme.buttonColor,
                            radius: 10, 
                            onTap:() {
                              if (emailController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "Your email is empty",
                                  fontSize: 15,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.SNACKBAR,
                                );
                              } else if (passwordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "your password empty",
                                  fontSize: 15,
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.SNACKBAR,
                                );
                              } else {
                                authController.loginUser(
                                context: context,
                                    userEmail: emailController.text,
                                    userPassword: passwordController.text);
                                
                              }
                            }, 
                           
                            
                            ),
                        );





                        //  SizedBox(
                        //   width: double.infinity,
                        //   height: 60,
                         
                        //   child:ElevatedButton(
                        //     onPressed:   () {
                        //       if (emailController.text.isEmpty) {
                        //         Fluttertoast.showToast(
                        //           msg: "Your email is empty",
                        //           fontSize: 15,
                        //           toastLength: Toast.LENGTH_LONG,
                        //           gravity: ToastGravity.SNACKBAR,
                        //         );
                        //       } else if (passwordController.text.isEmpty) {
                        //         Fluttertoast.showToast(
                        //           msg: "your password empty",
                        //           fontSize: 15,
                        //           toastLength: Toast.LENGTH_LONG,
                        //           gravity: ToastGravity.SNACKBAR,
                        //         );
                        //       } else {
                        //         authController.loginUser(
                        //         context: context,
                        //             userEmail: emailController.text,
                        //             userPassword: passwordController.text);
                                
                        //       }
                        //     }, 
                        //     child:authController.loginDataState==DataState.loading?
                        //     CircularProgressIndicator(
                        //       color: Colors.redAccent,
                        //     ): Text("Login")
                        //   )
                        // );
                        
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: "Don't have an account?",
                          fontSize: 18,
                          color: PTheme.textColor2,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomTextButton(
                          title: "Sign Up",
                          fontSize: 18,
                          color: PTheme.buttonColor,
                          fontWeight: FontWeight.w700,
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isTap = false;
  void _togglePasswordView() {
    setState(() {
      isTap = !isTap;
    });
  }
}
