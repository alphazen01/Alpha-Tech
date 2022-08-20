import 'dart:convert';
import 'dart:io';
import 'package:alpha/api/url.dart';
import 'package:alpha/auth/log_in.dart';
import 'package:alpha/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sign_up_model.dart';
import '../models/user_model.dart';
import '../utils/services/dio_services.dart';
import 'package:http/http.dart' as http;

class UserApi{
   static Future<SignUpModel> userRegistration(
      {required String userName,
      required String userEmail,
      required String userPassword,
      required String userCofirmPassword,
      required File imagePathuser,
      required String contactNumber,
      required String nidNumber}) async {
    FormData payLoad = FormData.fromMap({
      'name': userName,
      'email': userEmail,
      'password': userPassword,
      'c_password': userCofirmPassword,
      'image_path': await MultipartFile.fromFile(imagePathuser.path,
          filename: "user.jpeg"),
      'contact_number': contactNumber,
      'nid_number': nidNumber,
    });

    var res = await postWithoutBase(path: Urls.userResigration, data: payLoad);
    return signUpModelFromJson(res.data);
  }


static Future <LoginModel>loginUser({
  required String userEmail,
  required String userPassword,
})async{
  FormData payLoad = FormData.fromMap({
    "email":userEmail,
    "password":userPassword
  });
  var response = await
  postWithoutBase(
    path: Urls.userLogin,data: payLoad
  );
  return LoginModel.fromJson(response.data);
}
  static Future<UserProfileModel> userProfile() async {
    Response res = await getHttp(
      path: Urls.userProfile,
    );
    ;
    return UserProfileModel.fromJson(res.data);
  }



}