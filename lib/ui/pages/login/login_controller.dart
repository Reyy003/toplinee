import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/local/local_repository.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';
import 'package:topline_mobile_app/core/helper/validator.dart';
import 'package:topline_mobile_app/core/service/services.dart';

class LoginController extends GetxController {
  // Init API Provider
  AuthProvider authApi = AuthProvider();
  DialogService dialog = Get.find<DialogService>();

  // FocusNode
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  // TextEditingController
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  void doLogin() {
    // Username checking
    if (!checkLength(usernameInput.text, 4)) {
      usernameFocus.requestFocus();
      showSnackbar("Username minimal 4 huruf", false);
      return;
    }

    // Password checking
    if (!checkLength(passwordInput.text, 6)) {
      passwordFocus.requestFocus();
      showSnackbar("Password minimal 6 huruf", false);
      return;
    }

    // Call to API Service
    authApi.loginUser(
      data: LoginRequest(
        username: usernameInput.text,
        password: passwordInput.text,
      ),
      beforeSend: () {
        // Show loading dialog
        dialog.showLoading();
      },
      onSuccess: (response) {
        // Set token to API Service
        Get.find<ApiRequestService>().authorization = response.jwt;

        // Save data to local
        LocalRepository.setPrefsCredentials(response.jwt);
        LocalRepository.setPrefsLogin(true);

        // Close loading dialog
        dialog.hideLoading();

        // Move to home page
        Get.offAllNamed(AppRoutes.homeRoute);
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
