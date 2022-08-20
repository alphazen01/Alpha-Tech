import 'package:alpha/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/enum.dart';
import '../../utils/constant/theme.dart';
import '../../utils/widgets/Buttons/custom_button.dart';
import '../../utils/widgets/Buttons/text_button.dart';
import '../../utils/widgets/custom_text.dart';
import '../../utils/widgets/custom_textfield.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CustomText(
                      title: "Profile",
                      fontSize: 24,
                      color: PTheme.textColor3,
                      ),
                     
                   ],
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
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                      children: [
                         InkWell(
                          onTap: (){
                          },
                          child: CircleAvatar(
                            backgroundColor: PTheme.textColor,
                            radius:60,
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
                      child:
                      CustomButton(
                        title: "Update",
                        fontSize: 20,
                        color: PTheme.buttonColor,
                        fontWeight: FontWeight.w700, 
                        onTap: (){
                       
                        }, 
                        radius: 10
                        ),
                     
                      ),
                      SizedBox(height: 10,),  
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