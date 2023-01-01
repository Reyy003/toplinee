part of '../models.dart';

class TopUpRequest {
  late String gameId;
  late String gameName;
  late String orderValue;
  late String currency;

  TopUpRequest({
    required this.gameId,
    required this.gameName,
    required this.orderValue,
    required this.currency,
  });

  // Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'game_id': gameId,
      'game_name': gameName,
      'order_value': orderValue,
      'currency': currency,
    };
  }
}
