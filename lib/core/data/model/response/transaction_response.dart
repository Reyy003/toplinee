part of '../models.dart';

class TransactionResponse {
  late bool success;
  late String message;
  List<Transaction> transactions = [];

  TransactionResponse({
    required this.success,
    required this.message,
    required this.transactions,
  });

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    success = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      var data = (json['data'] as List);

      for (var d in data) {
        transactions.add(Transaction.fromJson(d));
      }
    }
  }
}

class Transaction {
  late String id;
  late String username;
  late String gameId;
  late String gameName;
  late DateTime dateTime;
  late String nominal;
  late String currency;
  late bool hasSend;

  Transaction({
    required this.id,
    required this.username,
    required this.gameId,
    required this.dateTime,
    required this.nominal,
    required this.currency,
    required this.hasSend,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    gameId = json['id_game'];
    gameName = json['game'];
    dateTime = DateTime.parse(json['tgl_pembelian']);
    nominal = json['jumlah_uang'];
    currency = json['satuan'];
    hasSend = (json['terkirim'] == "1");
  }
}
