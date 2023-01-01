part of '../models.dart';

class GameResponse {
  late bool success;
  late String message;
  List<Game> games = [];

  GameResponse({
    required this.success,
    required this.message,
    required this.games,
  });

  GameResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      var data = (json['data'] as List);

      for (var d in data) {
        games.add(Game.fromJson(d));
      }
    }
  }
}

class Game {
  late String id;
  late String name;
  late String icon;
  late String currency;
  late String? tutorial;

  Game({
    required this.id,
    required this.name,
    required this.icon,
    required this.currency,
    required this.tutorial,
  });

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nama'];
    icon = "$baseUrl/assets/img/covers/${json['gambar']}";
    currency = json['satuan'];
    tutorial = json['tutorial'];
  }
}
