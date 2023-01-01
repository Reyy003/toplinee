import 'package:get/get.dart';
import 'package:topline_mobile_app/app/theme.dart';

bool checkLength(String text, int minLength, {int maxLength = 30}) {
  if (text.length < minLength || text.length > maxLength) {
    return false;
  }
  return true;
}

void showSnackbar(String message, bool isSucces) {
  Get.snackbar(
    isSucces ? "Berhasil" : "Error",
    message,
    duration: const Duration(seconds: 2),
    colorText: textColor1,
    backgroundColor: isSucces ? greenColor : alertColor1,
  );
}
