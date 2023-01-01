import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';

class TransactionsController extends GetxController {
  var inputFormat = DateFormat('dd MMMM, yyyy');

  // Init API Provider
  TransactionProvider transactionApi = TransactionProvider();

  List<Transaction> transactions = [];
  RxBool hasGetTransactions = false.obs;

  TransactionsController() {
    getTransaction();
  }

  void getTransaction() {
    transactionApi.getTransactions(
      onSuccess: (response) {
        transactions = response.transactions;
        hasGetTransactions.value = true;
      },
      onError: (response) {},
    );
  }
}
