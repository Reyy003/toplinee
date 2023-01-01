part of '../models.dart';

class RegisterRequest {
  String name;
  String username;
  String password;

  RegisterRequest({
    required this.name,
    required this.username,
    required this.password,
  });

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
    };
  }
}
