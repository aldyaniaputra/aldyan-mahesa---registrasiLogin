// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    required this.code,
    required this.status,
    required this.message,
    required this.data
  });

  int code;
  bool status;
  String message;
  Data data;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson()
  };
}

class Data{
  String phoneNumber;
  String name;
  String email;
  String position;
  String company;
  String localImage;
  String image;
  String unit;
  String guid;
  String appType;
  String role;

  Data({
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.position,
    required this.company,
    required this.localImage,
    required this.image,
    required this.unit,
    required this.guid,
    required this.appType,
    required this.role
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      phoneNumber: json["PHONE_NUMBER"],
      name: json["NAME"],
      email: json["EMAIL"],
      position: json["POSITION"],
      company: json["COMPANY"],
      localImage: json["LOCAL_IMAGE"],
      image: json["IMAGE"],
      unit: json["UNIT"],
      guid: json["GUID"],
      appType: json["APP_TYPE"],
      role: json["ROLE"]
  );

  Map<String, dynamic> toJson() => {
    "PHONE_NUMBER": phoneNumber,
    "NAME": name,
    "EMAIL": email,
    "POSITION": position,
    "COMPANY": company,
    "LOCAL_IMAGE": localImage,
    "IMAGE": image,
    "UNIT": unit,
    "GUID": guid,
    "APP_TYPE": appType,
    "ROLE": role
  };

}
