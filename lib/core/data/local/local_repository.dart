import 'package:get_storage/get_storage.dart';
import 'package:topline_mobile_app/app/key.dart';

// =========================
// Service to handle 
// local storage
// =========================

class LocalRepository {
  static final GetStorage localStorage = GetStorage();

  static bool get isLoggedIn => localStorage.read(DatabaseKeys.keyIsLoggedIn) ?? false;

  static setPrefsLogin(bool isLoggedin) {
    localStorage.write(DatabaseKeys.keyIsLoggedIn, isLoggedin);
  }

  static String? get getPrefsCredentials =>
      localStorage.read(DatabaseKeys.keyCredentials);

  static setPrefsCredentials(String credentials) {
    localStorage.write(DatabaseKeys.keyCredentials, credentials);
  }

  static removeCredentials() => localStorage.remove(DatabaseKeys.keyCredentials);

}
