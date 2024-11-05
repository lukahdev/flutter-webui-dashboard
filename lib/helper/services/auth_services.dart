import 'dart:convert';

import 'package:get/get.dart';
import 'package:webui/helper/providers/user_provider.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/models/dummy_user.dart';
import 'package:webui/models/user.dart';

class AuthService {
  static bool isLoggedIn = false;


  static Future<Map<String, String>?> loginUser(
      Map<String, dynamic> data) async {
    UserProvider provider = UserProvider();
    Response response = await provider
        .login({"email": data['email'], "password": data['password']});

    print("RESPONSE: ${response.bodyString}");

    LoginResponse loginResponse =
        LoginResponse.fromJson(jsonDecode(response.bodyString!));

    if (loginResponse.status == 'error') {
      switch (loginResponse.type) {
        case "INVALID_USER":
          {
            return {"email": loginResponse.message};
          }
        case "INCORRECT_PASSWORD":
          {
            return {"password": loginResponse.message};
          }
        default:
          {
            return {"notify": loginResponse.message};
          }
      }
    }

    isLoggedIn = true;
    await LocalStorage.setLoggedInUser(true);
    await LocalStorage.setLoggedInUserData(loginResponse.data!);
    return null;
  }
}

class LoginResponse {
  final String status;
  final String type;
  final String message;
  final User? data;

  LoginResponse(
      {required this.status,
      required this.message,
      required this.type,
      this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      type: json['type'],
      message: json['message'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'type': type,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
