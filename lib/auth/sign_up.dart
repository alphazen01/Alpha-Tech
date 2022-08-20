

import 'dart:io';

import 'package:alpha/auth/log_in.dart';
import 'package:alpha/controller/auth_controller.dart';
import 'package:alpha/utils/constant/enum.dart';
import 'package:alpha/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../utils/constant/theme.dart';
import '../utils/widgets/Buttons/custom_button.dart';
import '../utils/widgets/Buttons/text_button.dart';
import '../utils/widgets/custom_text.dart';
import '../utils/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: PTheme.paddingX),
                 child: CustomText(
                  title: "Sign Up",
                  fontSize: 24,
                  color: PTheme.textColor3,
                  ),
               ),
                SizedBox(height: 20,),
               Container(
               padding: const EdgeInsets.symmetric(horizontal: PTheme.paddingX,vertical: PTheme.paddingY),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: SingleChildScrollView(
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
                      Consumer<AuthController>(
                        builder: (context, authController, child) => 
                         InkWell(
                          onTap: (){
                            authController.getUserProfileImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: PTheme.textColor,
                            radius:60,
                     foregroundImage:   (authController.imagePathForUser != null)
                     ? FileImage(authController.imagePathForUser!)
                     : null,
                          ),
                        ),
                      ),
                      CustomTextField(
                      controller:nameController ,
                      readOnly: false,
                      obscureText: false,
                      title: "Full Name", 
                      prefixIcon: Icons.person
                      ),
                      SizedBox(height: 15,),
                      CustomTextField(
                      controller:phoneController,
                      type: TextInputType.phone,
                      readOnly: false,
                      obscureText: false,
                      title: "Phone Number", 
                      prefixIcon: Icons.phone
                      ),
                      SizedBox(height: 15,),
                       CustomTextField(
                      controller:nidController,
                      type: TextInputType.phone,
                      readOnly: false,
                      obscureText: false,
                      title: "Nid Number", 
                      prefixIcon: Icons.phone
                      ),
                      SizedBox(height: 15,),
                      CustomTextField(
                      controller:emailController,
                      type: TextInputType.emailAddress,
                      obscureText: false,
                      readOnly: false,
                      title: "Email", 
                      prefixIcon: Icons.mail_outline
                      ),
                      SizedBox(height: 15,),
                      CustomTextField(
                      controller:passwordController ,
                      obscureText: !isTap,
                      readOnly: false,
                      title: "Password", 
                      prefixIcon: Icons.lock,
                      suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(isTap?
                      Icons.visibility:Icons.visibility_off
                      )
                      ),
                      ),
                      SizedBox(height: 15,),
                      CustomTextField(
                      controller:confirmPasswordController ,
                      obscureText: !isTap,
                      readOnly: false,
                      title: "Confirm Password", 
                      prefixIcon: Icons.lock,
                      suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(isTap?
                      Icons.visibility:Icons.visibility_off
                      )
                      ),
                      ),
                      
                      ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                      width: double.infinity,
                      height: 60,
                      child:Consumer<AuthController>(
                        builder: (context, authController, child) =>
                        authController.loginDataState==DataState.loading?
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ): 
                         CustomButton(
                        title: "Sign Up",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: PTheme.buttonColor,
                        radius: 10, 
                        onTap: (){
                          if(authController.signUpDataState==DataState.loading){
                            return;
                          }
                         if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(
                        msg: "Enter your name",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        } else if (phoneController.text.isEmpty) {
                        Fluttertoast.showToast(
                        msg: "Enter your phone number",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        else if(
                        phoneController.text.length <11 || 
                        phoneController.text.length >11 ){
                        Fluttertoast.showToast(
                        msg: "Phone number should be 11 digit",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        else if(nidController.text.isEmpty){
                        Fluttertoast.showToast(
                        msg: "Enter your Nid Number",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        else if(emailController.text.isEmpty){
                        Fluttertoast.showToast(
                        msg: "Enter your email",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        else if(passwordController.text.isEmpty){
                        Fluttertoast.showToast(
                        msg: "Confirm your password",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        else if(confirmPasswordController.text.isEmpty){
                        Fluttertoast.showToast(
                        msg: "Confirm your password",
                        fontSize: 15,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        );
                        }
                        
                        else {
                          authController.registrationUser(
                            context: context,
                            userName: nameController.text, 
                            email: emailController.text, 
                            password: passwordController.text, 
                            cPaseword: confirmPasswordController.text, 
                            number: phoneController.text, 
                            nidNumber:nidController.text , 
                    
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                        }
                        }, 
                        
                        ),
                      ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CustomText(
                      title: "Do you have an account?",
                      fontSize: 18,
                      color: PTheme.textColor2,
                      fontWeight: FontWeight.w700,
                      ),
                      CustomTextButton(
                      title: "Log In",
                      fontSize: 18,
                      color: PTheme.buttonColor,
                      fontWeight: FontWeight.w700, 
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                      }, 
                      ),
                      ],
                      ),
                      
                        
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  bool isTap = false;
  void _togglePasswordView(){
    setState(() {
      isTap=!isTap;
    });
  }
  
}
