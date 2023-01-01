part of '../models.dart';

class LoginRequest {
  String username;
  String password;

  LoginRequest({required this.username, required this.password});

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
