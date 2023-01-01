part of '../models.dart';

class UserResponse {
  late bool success;
  late String message;
  late String id;
  late String username;
  late String name;

  UserResponse({
    required this.success,
    required this.message,
    required this.id,
    required this.username,
    required this.name,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      var data = (json['data'] as Map<String, dynamic>);

      id = data['id'];
      username = data['username'];
      name = data['name'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    return data;
  }
}
