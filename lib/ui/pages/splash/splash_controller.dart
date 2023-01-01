import 'package:get/get.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/core/data/local/local_repository.dart';

class SplashController extends GetxController {
  SplashController() {
    init();
  }

  void init() {
    bool result = LocalRepository.isLoggedIn;

    if (result) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.offAllNamed(AppRoutes.homeRoute);
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.offAllNamed(AppRoutes.loginRoute);
        },
      );
    }
  }
}
