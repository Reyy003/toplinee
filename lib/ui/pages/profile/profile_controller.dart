import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/core/data/local/local_repository.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';
import 'package:topline_mobile_app/core/helper/validator.dart';
import 'package:topline_mobile_app/core/service/services.dart';

class ProfileController extends GetxController {
  // Init API Provider
  AuthProvider authApi = AuthProvider();
  DialogService dialog = Get.find<DialogService>();

  UserResponse user = (Get.arguments as UserResponse);

  // FocusNode
  FocusNode newPasswordFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  // TextEditingController
  TextEditingController newPasswordInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  Future<void> deleteAccount() async {
    // Call to API Service
    authApi.deleteUser(
      beforeSend: () {
        // Show loading dialog
        dialog.showLoading();
      },
      onSuccess: (response) {
        // Close loading dialog
        dialog.hideLoading();

        // Move to home page
        showSnackbar(
          response.message,
          response.success,
        );

        // Kick user to login page
        LocalRepository.removeCredentials();
        LocalRepository.setPrefsLogin(false);
        Get.offAllNamed(AppRoutes.loginRoute);
      },
      onError: (response) {
        // Close loading dialog
        dialog.hideLoading();

        // Show error message
        dialog.showErrorDialog(response.message);
      },
    );
  }

  Future<void> doChangePassword() async {
    // Current Password checking
    if (!checkLength(passwordInput.text, 6)) {
      passwordFocus.requestFocus();
      showSnackbar("Password minimal 6 huruf", false);
      return;
    }

    // Confirm Password checking
    if (!(passwordInput.text == confirmPasswordInput.text)) {
      confirmPasswordFocus.requestFocus();
      showSnackbar("Konfirmasi password tidak sama", false);
      return;
    }

    // New Password checking
    if (!checkLength(newPasswordInput.text, 6)) {
      newPasswordFocus.requestFocus();
      showSnackbar("Password baru minimal 6 huruf", false);
      return;
    }

    // Call to API Service
    authApi.changePasswordUser(
      data: ChangePasswordRequest(
        password: passwordInput.text,
        newPassword: newPasswordInput.text,
      ),
      beforeSend: () {
        // Show loading dialog
        dialog.showLoading();
      },
      onSuccess: (response) {
        // Close loading dialog
        dialog.hideLoading();

        // Move to home page
        showSnackbar(
          response.message,
          response.success,
        );

        // Clear input text
        passwordInput.clear();
        confirmPasswordInput.clear();
        newPasswordInput.clear();
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
