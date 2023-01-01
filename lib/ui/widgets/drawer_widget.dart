part of 'widgets.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 0.8.sw,
        decoration: BoxDecoration(color: drawerColor),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawerHeader(),
            _drawerItem(
              icon: Eva.home_fill,
              text: 'HALAMAN UTAMA',
              onTap: () => Get.back(),
              isActive: true,
            ),
            _drawerItem(
              icon: Eva.swap_fill,
              text: 'RIWAYAT TRANSAKSI',
              onTap: () => Get.toNamed(AppRoutes.transactionsRoute),
            ),
            _drawerItem(
              icon: Eva.message_square_outline,
              text: 'CHAT',
              onTap: () async {
                // TODO: Ganti nomor WhatsApp
                var phoneNumber = "+62812-3453-5307";
                var message = "";
                await launchUrl(
                  Uri.parse(
                    "https://wa.me/$phoneNumber?text=$message",
                  ),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
            _drawerItem(
              icon: Eva.question_mark_circle_fill,
              text: 'TENTANG',
              onTap: () => showAboutUs(context),
            ),
            const Divider(
              height: 25,
              thickness: 5,
              color: Colors.white,
            ),
            _logoutItem(
              icon: Eva.power_fill,
              text: 'Keluar',
            ),
          ],
        ),
      ),
    );
  }
}

void showAboutUs(
  BuildContext context,
) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: TextFormat(
          'About Us',
          42.sp,
          fontWeight: FontWeight.w900,
          fontColor: textColor2,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconApp(size: 108.h),
            TextFormat(
              "TOPLINE",
              38.sp,
              fontWeight: FontWeight.w900,
              fontColor: textColor2,
            ),
            TextFormat(
              "App Version ${packageInfo.version}",
              32.sp,
              fontWeight: FontWeight.w500,
              fontColor: textColor2,
            ),
          ],
        ),
      );
    },
  );
}

Widget _drawerHeader() {
  final controller = Get.find<HomeController>();

  return Column(
    children: [
      Row(
        children: [
          IconApp(size: 108.h),
          SizedBox(width: 8.w),
          TextFormat(
            "TOPLINE",
            38.sp,
            fontWeight: FontWeight.w900,
          ),
        ],
      ),
      SizedBox(height: 32.h),
      GestureDetector(
        onTap: () {
          Get.toNamed(
            AppRoutes.profileRoute,
            arguments: controller.user,
          );
        },
        child: Row(
          children: [
            SizedBox(width: 48.w),
            Image.asset(
              '${Global.icons}/user.png',
              scale: 0.75,
            ),
            SizedBox(width: 24.w),
            Obx(() {
              var name = "";
              if (controller.hasGetUser.value) {
                name = controller.user!.name;
              }

              return TextFormat(
                "Hallo $name",
                36.sp,
              );
            }),
          ],
        ),
      ),
      SizedBox(height: 48.h),
    ],
  );
}

Widget _drawerItem({
  required String icon,
  required String text,
  required GestureTapCallback onTap,
  bool isActive = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: isActive ? buttonColor : null,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          Iconify(
            icon,
            color: Colors.white,
            size: 56.w,
          ),
          SizedBox(width: 12.w),
          TextFormat(
            text,
            34.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}

Widget _logoutItem({
  required String icon,
  required String text,
}) {
  return GestureDetector(
    onTap: () {
      // Save data to local
      LocalRepository.removeCredentials();
      LocalRepository.setPrefsLogin(false);
      Get.offAllNamed(AppRoutes.loginRoute);
    },
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      margin: EdgeInsets.only(
        top: 24.h,
        bottom: 48.h,
      ),
      decoration: BoxDecoration(
        color: logoutColor,
        borderRadius: BorderRadius.circular(56.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Iconify(
            icon,
            color: Colors.white,
            size: 56.w,
          ),
          SizedBox(width: 12.w),
          TextFormat(
            text,
            32.sp,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    ),
  );
}
