import 'package:get/get.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';
import 'package:topline_mobile_app/core/helper/validator.dart';
import 'package:topline_mobile_app/core/service/services.dart';

class TopUpController extends GetxController {
  // Init API Provider
  BasicProvider basicApi = BasicProvider();
  TransactionProvider transactionApi = TransactionProvider();

  DialogService dialog = Get.find<DialogService>();

  List<Nominal> amounts = [];
  RxBool hasGetAmounts = false.obs;

  Game game = (Get.arguments as Game);
  Nominal? selectedAmount;

  TopUpController() {
    getNominal();
  }

  Future<void> getNominal() async {
    basicApi.getNominals(
      gameId: game.id,
      onSuccess: (response) {
        amounts = response.nominals;
        hasGetAmounts.value = true;
      },
      onError: (response) {},
    );
  }

  Future<void> doTopUp() async {
    // Call to API Service
    transactionApi.createTopUp(
      data: TopUpRequest(
        gameId: game.id,
        orderValue: "${selectedAmount!.amount}",
        gameName: game.name,
        currency: game.currency,
      ),
      beforeSend: () {
        // Show loading dialog
        dialog.showLoading();
      },
      onSuccess: (response) {
        // Close loading dialog
        dialog.hideLoading();
        showSnackbar(response.message, response.success);

        // Move to home payment
        Get.offAllNamed(AppRoutes.paymentRoute);
      },
      onError: (response) {
        // Close loading dialog
        dialog.hideLoading();

        // Show error message
        dialog.showErrorDialog(response.message);
      },
    );
  }
}
