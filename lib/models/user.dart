class User {
  final String uid;
  final String email;
  final String password;
  final String authTypeId;
  final int isActive;
  final String createdAt;

  User({
    required this.uid,
    required this.email,
    required this.password,
    required this.authTypeId,
    required this.isActive,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      authTypeId: json['auth_type_id'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'auth_type_id': authTypeId,
      'is_active': isActive,
      'created_at': createdAt,
    };
  }
}