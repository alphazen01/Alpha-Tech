import 'dart:io';

import 'package:alpha/auth/log_in.dart';
import 'package:alpha/models/login_model.dart';
import 'package:alpha/models/sign_up_model.dart';
import 'package:alpha/utils/constant/enum.dart';
import 'package:alpha/utils/navigation/navigation_screen.dart';
import 'package:alpha/utils/services/dio_services.dart';
import 'package:alpha/utils/services/share_prefer_services.dart';
import 'package:alpha/view/profile/profile_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/users_api.dart';
import '../models/user_model.dart';
import '../utils/constant/pkeys.dart';

class AuthController extends ChangeNotifier{
DataState signUpDataState=DataState.initial;
DataState loginDataState=DataState.initial;
DataState logoutDataState=DataState.initial;
DataState imageTakingState=DataState.initial;
SignUpModel signUPInfo=SignUpModel();
LoginModel loginInfo = LoginModel();
 UserProfileModel userInfo = UserProfileModel();
File? imagePathForUser;


registrationUser({
 required String userName,
 required String email,
 required String password,
 required String cPaseword,
 required String number,
 required String nidNumber,
 required context,

  
})async{
signUpDataState=DataState.loading;
notifyListeners();
try {
  signUPInfo=await UserApi.userRegistration(
  userName: userName, userEmail: email, 
  userPassword: password, 
  userCofirmPassword: cPaseword, 
  imagePathuser: imagePathForUser!, 
  contactNumber: number, nidNumber: nidNumber
  );
  DioSingleton.instance.update(signUPInfo.data!.token);


   
     
    } catch (e) {
      print(e);
       signUpDataState = DataState.error;
       Fluttertoast.showToast(msg: "Something is Wrong");
    }
    notifyListeners();
  }

  getUserProfileImage() async {
    imageTakingState = DataState.loading;
    notifyListeners();
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 500,
        maxWidth: 500);
    if (image != null) {
      imagePathForUser = File(image.path);

      imageTakingState = DataState.loaded;
    } else {
      imageTakingState = DataState.error;
    }
    notifyListeners();
  }
  loginUser({
  required String userEmail,
  required String userPassword,
  required context,
  })async{
    loginDataState = DataState.loading;
    notifyListeners();
    try {
      loginInfo =await UserApi.loginUser(
        userEmail: userEmail, 
        userPassword: userPassword
      );
        DioSingleton.instance.update(loginInfo.data!.token);
      loginDataState = DataState.loaded;
SharedPreferencesService.instance.setBool('loggedIn', true);
SharedPreferencesService.instance.setString('email', userEmail);
SharedPreferencesService.instance.setString('password', userPassword);

    Navigator.pushReplacement(context,  MaterialPageRoute(
      builder: (_) => NavigationScreen(selectedItem: 0,)));
     
    } catch (e) {
      print(e);
       loginDataState = DataState.error;
       Fluttertoast.showToast(msg: "Something is Wrong");
    }
    notifyListeners();
  }

void logoutUser({required context})async{
  logoutDataState=DataState.loading;
notifyListeners();
try {
  SharedPreferences prefs = await SharedPreferences.getInstance();
SharedPreferencesService.instance.setBool('loggedIn', false);
logoutDataState = DataState.loaded;
prefs.clear(); 
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
} catch (e) {
  print(e);
   logoutDataState = DataState.error;
       Fluttertoast.showToast(msg: "Something is Wrong");
}
notifyListeners();
}




}