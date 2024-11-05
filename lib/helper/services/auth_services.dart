import 'package:get/get.dart';
import 'package:webui/helper/providers/user_provider.dart';
import 'package:webui/helper/storage/local_storage.dart';
import 'package:webui/models/dummy_user.dart';
import 'package:webui/models/user.dart';

class AuthService {
  static bool isLoggedIn = false;

  static DummyUser get dummyUser =>
      DummyUser(-1, "temp@getappui.com", "Denish", "Navadiya");

  static Future<Map<String, String>?> loginUser(
      Map<String, dynamic> data) async {

    UserProvider provider = UserProvider();
    Response response = await provider.login({
      "email": data['email'],
      "password": data['password']
    });



    // -- Use only for dummy debug --
    // await Future.delayed(Duration(seconds: 1));
    // if (data['email'] != dummyUser.email) {
    //   return {"email": "This email is not registered"};
    // } else if (data['password'] != "1234567") {
    //   return {"password": "Password is incorrect"};
    // }

    isLoggedIn = true;
    await LocalStorage.setLoggedInUser(true);
    return null;
  }

}

class LoginResponse {
  final String status;
  final String message;
  final User data;

  LoginResponse({required this.status, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: User.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}