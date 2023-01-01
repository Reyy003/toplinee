part of '../models.dart';

class SuccessResponse {
  late bool success;
  late String message;

  SuccessResponse({
    required this.success,
    required this.message,
  });

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = success;
    data['error'] = message;
    return data;
  }
}
