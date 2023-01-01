import 'package:get/get.dart';
import 'package:topline_mobile_app/core/service/services.dart';

// =========================
// Setup depedency injection 
// =========================

void setupInjector() {
  // Inject API Service
  Get.put(
    ApiRequestService(),
    permanent: true,
  );

  // Inject Dialog Service
  Get.put(
    DialogService(),
    permanent: true,
  );
}
