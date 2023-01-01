import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:topline_mobile_app/app/injector.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';

void main() async {
  // Init local storage
  await GetStorage.init();

  setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(720, 1280),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: "Topline",
              initialRoute: AppRoutes.mainRoute,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: GoogleFonts.urbanistTextTheme().apply(
                  bodyColor: Colors.white,
                ),
              ),
              onGenerateRoute: (settings) {
                return PageTransition(
                  child: DialogManager(
                    child: AppPages.pages[settings.name]!(context),
                  ),
                  type: PageTransitionType.leftToRightWithFade,
                  curve: Curves.ease,
                  settings: settings,
                  duration: const Duration(milliseconds: 300),
                );
              });
        });
  }
}
