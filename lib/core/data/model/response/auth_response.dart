part of '../models.dart';

class AuthResponse {
  late bool success;
  late String message;
  late String jwt;

  AuthResponse({
    required this.success,
    required this.message,
    required this.jwt,
  });

  @override
  AuthResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      var data = (json['data'] as Map<String, dynamic>);
      
      jwt = data['token'];
    }
  }
}
