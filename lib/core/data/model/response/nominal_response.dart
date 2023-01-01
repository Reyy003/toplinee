part of '../models.dart';

class NominalResponse {
  late bool success;
  late String message;
  List<Nominal> nominals = [];

  NominalResponse({
    required this.success,
    required this.message,
    required this.nominals,
  });

  NominalResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      var data = (json['data'] as List);

      for (var d in data) {
        nominals.add(Nominal.fromJson(d));
      }
    }
  }
}

class Nominal {
  late String id;
  late String gameId;
  late int amount;
  late int price;
  late String icon;
  late int bonus;

  Nominal({
    required this.id,
    required this.gameId,
    required this.amount,
    required this.price,
    required this.icon,
    required this.bonus,
  });

  Nominal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameId = json['game_id'];
    amount = int.parse(json['amount']);
    price = int.parse(json['price']);
    icon = "$baseUrl/assets/img/icons/${json['icon']}";
    bonus = int.parse(json['bonus']);
  }
}
