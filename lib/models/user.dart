import 'dart:convert';

class User {
  final String uid;
  final String email;
  final String password;
  final String authTypeId;
  final int isActivated;
  final String createdAt;

  User({
    required this.uid,
    required this.email,
    required this.password,
    required this.authTypeId,
    required this.isActivated,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      authTypeId: json['auth_type_id'],
      isActivated: json['is_activated'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'auth_type_id': authTypeId,
      'is_activated': isActivated,
      'created_at': createdAt,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}