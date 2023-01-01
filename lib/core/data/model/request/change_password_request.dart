part of '../models.dart';

class ChangePasswordRequest {
  String newPassword;
  String password;

  ChangePasswordRequest({
    required this.newPassword,
    required this.password,
  });

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'new_password': newPassword,
      'password': password,
    };
  }
}
