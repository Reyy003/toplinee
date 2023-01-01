import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:topline_mobile_app/app/key.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';
import 'package:topline_mobile_app/ui/pages/profile/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    '${Global.icons}/user.png',
                    scale: 0.4,
                  ),
                  TextFormat(
                    controller.user.name,
                    48.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                BackWidget(onTap: () => Get.back()),
                SizedBox(width: 32.w),
                TextFormat(
                  "Keamanan Akun",
                  38.sp,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            TextFormat(
              "Create Your New Password",
              38.sp,
              fontColor: textColor2,
            ),
            SizedBox(height: 32.h),
            InputField(
              controller.passwordInput,
              focusNode: controller.passwordFocus,
              textSize: 30.sp,
              hint: "Masukkan kata sandi saat ini",
              textColor: textColor2,
              inputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 32.h),
            InputField(
              controller.confirmPasswordInput,
              focusNode: controller.confirmPasswordFocus,
              textSize: 30.sp,
              hint: "Konfirmasi kata sandi saat ini",
              textColor: textColor2,
              inputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 32.h),
            InputField(
              controller.newPasswordInput,
              focusNode: controller.newPasswordFocus,
              textSize: 30.sp,
              hint: "Masukkan kata sandi baru",
              textColor: textColor2,
              inputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                text: "Simpan Perubahan",
                boxColor: buttonColor,
                fontColor: textColor1,
                onTap: () => controller.doChangePassword(),
                fontSize: 38.sp,
                fontWeight: FontWeight.w600,
                minimumSize: Size(0.5.sw, 0.07.sh),
              ),
            ),
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormat(
                  "Hapus Akun",
                  38.sp,
                  fontColor: textColor2,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(
                  width: 0.75.sw,
                  child: TextFormat(
                    "Dengan menghapus akun Anda, semua informasi akan hilang. Proses tidak dapat di batalkan.",
                    32.sp,
                    fontColor: textColor1,
                    textAlign: TextAlign.start,
                    maxLines: 6,
                  ),
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () => controller.deleteAccount(),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: textColor2,
                        size: 64.h,
                      ),
                      TextFormat(
                        "Menghapus akun Topline saya",
                        34.sp,
                        fontColor: textColor2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileController>();
    super.dispose();
  }
}
