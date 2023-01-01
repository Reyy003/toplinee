part of '../models.dart';

class PaymentResponse {
  late bool success;
  late String message;
  List<Payment> payments = [];

  PaymentResponse({
    required this.success,
    required this.message,
    required this.payments,
  });

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      var data = (json['data'] as List);

      for (var d in data) {
        payments.add(Payment.fromJson(d));
      }
    }
  }
}

class Payment {
  late String id;
  late String name;
  late String icon;
  late String accountNumber;

  Payment({
    required this.id,
    required this.name,
    required this.icon,
    required this.accountNumber,
  });
  
  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountNumber = json['account_number'];
    icon = "$baseUrl/assets/img/icons/${json['icon']}";
  }

}
