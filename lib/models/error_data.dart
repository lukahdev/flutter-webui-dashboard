class ErrorData {
  final String type;
  final String message;

  ErrorData({required this.type, required this.message});

  factory ErrorData.fromJson(Map<String, dynamic> json) {
    return ErrorData(type: json['type'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'message': message,
    };
  }
}
