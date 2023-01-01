import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/ui/pages/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      drawer: const DrawerWidget(),
      body: BackgroundWidget(
        child: Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _key.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.sort,
                      size: 72.h,
                    ),
                  ),
                  IconApp(size: 86.h),
                  TextFormat(
                    "TOPLINE",
                    32.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Obx(
                () {
                  if (!controller.hasGetGames.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: primaryColor1,
                        backgroundColor: Colors.white,
                      ),
                    );
                  }

                  if (controller.games.isEmpty) {
                    return Card(
                      elevation: 6,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 32.w,
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              color: alertColor1,
                              size: 200.h,
                            ),
                            TextFormat(
                              "Tidak ada game",
                              42.sp,
                              fontColor: textColor2,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.games.length,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) => Center(
                          child: gameWidget(controller.games[index])),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gameWidget(Game game) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.topUpRoute, arguments: game),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.w,
            width: 200.w,
            child: Image.network(
              fit: BoxFit.scaleDown,
              game.icon,
            ),
          ),
          TextFormat(
            game.name,
            36.sp,
            maxLines: 3,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
}
