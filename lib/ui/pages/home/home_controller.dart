import 'package:get/get.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/core/data/local/local_repository.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/data/remote/provider/providers.dart';
import 'package:topline_mobile_app/core/helper/validator.dart';
import 'package:topline_mobile_app/core/service/services.dart';

class HomeController extends GetxController {
  // Init API Provider
  AuthProvider authApi = AuthProvider();
  BasicProvider basicApi = BasicProvider();
  DialogService dialog = Get.find<DialogService>();

  UserResponse? user;
  RxBool hasGetUser = false.obs;
  List<Game> games = [];
  RxBool hasGetGames = false.obs;

  HomeController() {
    getUser();
    getGame();
  }

  Future<void> getGame() async {
    basicApi.getGames(
      onSuccess: (response) {
        games = response.games;
        hasGetGames.value = true;
      },
      onError: (response) {},
    );
  }

  Future<void> getUser() async {
    // Call to API Service
    authApi.getUser(
      onSuccess: (response) {
        user = response;
        hasGetUser.value = true;
      },
      onError: (response) {
        // Kick user to login page
        LocalRepository.removeCredentials();
        LocalRepository.setPrefsLogin(false);

        showSnackbar("Sesi telah habis, perlu re-log", false);
        Get.offAllNamed(AppRoutes.loginRoute);
      },
    );
  }
}
