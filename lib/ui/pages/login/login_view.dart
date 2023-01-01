import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/ui/pages/login/login_controller.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    color: primaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(254.h),
                    ),
                    child: IconApp(size: 254.h),
                  ),
                  TextFormat(
                    "Login",
                    48.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: 64.h),
                  InputField(
                    controller.usernameInput,
                    focusNode: controller.usernameFocus,
                    textSize: 30.sp,
                    hint: "Enter Username",
                    textColor: textColor2,
                    inputType: TextInputType.name,
                  ),
                  SizedBox(height: 32.h),
                  InputField(
                    controller.passwordInput,
                    focusNode: controller.passwordFocus,
                    textSize: 30.sp,
                    hint: "Enter Password",
                    textColor: textColor2,
                    inputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 64.h),
                  ActionButton(
                    text: "Login",
                    boxColor: buttonColor,
                    fontColor: textColor1,
                    onTap: () {
                      // Get.offAllNamed(AppRoutes.homeRoute);
                      controller.doLogin();
                    },
                    fontSize: 38.sp,
                    fontWeight: FontWeight.w600,
                    minimumSize: Size(0.85.sw, 0.07.sh),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormat(
                    "Belum memiliki akun? ",
                    28.sp,
                    fontColor: textColor2,
                    fontWeight: FontWeight.normal,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Push to Login Page
                      Get.toNamed(AppRoutes.registerRoute);
                    },
                    child: TextFormat(
                      "klik di sini",
                      30.sp,
                      fontColor: textColor1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }
}
