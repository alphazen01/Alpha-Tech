// To parse this JSON data, do
//
//     final loginUpModel = loginUpModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginUpModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginUpModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.success,
        this.data,
        this.message,
    });

    bool? success;
    Data? data;
    String? message;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        this.token,
        this.name,
        this.id,
    });

    String? token;
    String? name;
    int? id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "id": id,
    };
}
