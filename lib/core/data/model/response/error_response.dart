part of '../models.dart';

class ErrorResponse {
  late bool success;
  late String message;

  ErrorResponse({
    required this.success,
    required this.message,
  });

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = success;
    data['error'] = message;
    return data;
  }
}
