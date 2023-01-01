import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/ui/pages/register/register_controller.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: Center(
          child: Column(
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
                "Create New Account",
                48.sp,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(height: 64.h),
              InputField(
                controller.nameInput,
                focusNode: controller.nameFocus,
                textSize: 30.sp,
                hint: "Enter Name",
                textColor: textColor2,
                inputType: TextInputType.name,
              ),
              SizedBox(height: 32.h),
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
                text: "Create",
                boxColor: buttonColor,
                fontColor: textColor1,
                onTap: () => controller.doRegister(),
                fontSize: 38.sp,
                fontWeight: FontWeight.w600,
                minimumSize: Size(0.85.sw, 0.07.sh),
              ),
              SizedBox(height: 32.h),
              ActionButton(
                text: "Cancel",
                boxColor: alertColor2,
                fontColor: textColor1,
                onTap: () => Get.back(),
                fontSize: 38.sp,
                fontWeight: FontWeight.w600,
                minimumSize: Size(0.85.sw, 0.07.sh),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RegisterController>();
    super.dispose();
  }
}
