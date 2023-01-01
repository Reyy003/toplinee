import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/ui/pages/top_up/top_up_controller.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({Key? key}) : super(key: key);

  @override
  State<TopUpView> createState() => _TopUpViewState();
}

class _TopUpViewState extends State<TopUpView> {
  final controller = Get.put(TopUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundWidget(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                BackWidget(onTap: () => Get.back()),
                SizedBox(width: 24.w),
                TextFormat(
                  controller.game.name,
                  38.sp,
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            TextFormat(
              "Masukkan user id",
              38.sp,
              fontWeight: FontWeight.w800,
              fontColor: textColor2,
              textAlign: TextAlign.start,
            ),
            Card(
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                  horizontal: 24.w,
                ),
                child: Column(
                  children: [
                    InputField(
                      TextEditingController(),
                      textSize: 30.sp,
                      hint: "User id",
                      textColor: textColor2,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 24.h),
                    controller.game.name == "Mobile Legends"
                        ? Column(
                            children: [
                              InputField(
                                TextEditingController(),
                                textSize: 30.sp,
                                hint: "Zone Id",
                                textColor: textColor2,
                                inputType: TextInputType.name,
                              ),
                              SizedBox(height: 24.h),
                            ],
                          )
                        : const SizedBox(),
                    TextFormat(
                      controller.game.tutorial ?? "",
                      32.sp,
                      fontWeight: FontWeight.w500,
                      fontColor: textColor2,
                      textAlign: TextAlign.start,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 48.h),
            TextFormat(
              "Pilih nominal Top Up",
              38.sp,
              fontWeight: FontWeight.w800,
              fontColor: textColor2,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 24.h),
            Obx(() {
              if (!controller.hasGetAmounts.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor1,
                    backgroundColor: Colors.white,
                  ),
                );
              }

              if (controller.amounts.isEmpty) {
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
                          "Tidak nominal top up untuk game ini",
                          42.sp,
                          fontColor: textColor2,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.amounts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 24.w,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) =>
                    amountWidget(controller.amounts[index]),
              );
            }),
            SizedBox(height: 48.h),
            GetBuilder<TopUpController>(
              builder: ((controller) {
                if (controller.selectedAmount != null) {
                  return Column(
                    children: [
                      TextFormat(
                        "Total pembayaran : ${intToRupiah(controller.selectedAmount!.price)}",
                        48.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 48.h),
                      ActionButton(
                        text: "Bayar",
                        boxColor: buttonColor,
                        fontColor: textColor1,
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w600,
                        minimumSize: Size(0.85.sw, 0.07.sh),
                        onTap: () => controller.doTopUp(),
                      ),
                      SizedBox(height: 48.h),
                    ],
                  );
                }

                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }

  String intToRupiah(int number, {bool withSymbol = true}) {
    return NumberFormat.currency(
      locale: "id_ID",
      symbol: withSymbol ? "Rp" : "",
      decimalDigits: 0,
    ).format(number);
  }

  Widget amountWidget(Nominal amount) {
    return GestureDetector(
      onTap: () {
        controller.selectedAmount = amount;
        controller.update();
      },
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                height: 125.w,
                width: 125.w,
                amount.icon,
              ),
              TextFormat(
                "${amount.amount} ${controller.game.currency} ${(amount.bonus > 0) ? "+ ${amount.bonus} bonus" : ""}",
                36.sp,
                fontWeight: FontWeight.w600,
                fontColor: textColor2,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TopUpController>();
    super.dispose();
  }
}
