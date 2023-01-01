import 'package:get/get.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';

class PaymentController extends GetxController {
  // Init API Provider
  BasicProvider basicApi = BasicProvider();
  
  List<Payment> payments = [];
  RxBool hasGetPayments = false.obs;

  PaymentController() {
    getTransaction();
  }

  void getTransaction() {
    basicApi.getPayments(
      onSuccess: (response) {
        payments = response.payments;
        hasGetPayments.value = true;
      },
      onError: (response) {},
    );
  }
}
