import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/core/data/model/models.dart';
import 'package:topline_mobile_app/core/helper/validator.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';
import 'package:topline_mobile_app/ui/pages/payment/payment_controller.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.transactionsRoute);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
            left: 24.w,
            right: 24.w,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                BackWidget(onTap: () => Get.offAllNamed(AppRoutes.transactionsRoute)),
                SizedBox(width: 24.w),
                TextFormat(
                  "Metode Pembayaran",
                  42.sp,
                  fontWeight: FontWeight.w800,
                  fontColor: textColor2,
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Obx(
              () {
                if (!controller.hasGetPayments.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor1,
                      backgroundColor: Colors.white,
                    ),
                  );
                }
    
                if (controller.payments.isEmpty) {
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
                            "Tidak ada metode pembayaran tersedia",
                            42.sp,
                            fontColor: textColor2,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  );
                }
    
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.payments.length,
                  itemBuilder: ((context, index) {
                    return Center(
                      child: paymentWidget(controller.payments[index]),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentWidget(Payment payment) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          height: 200.w,
          width: 200.w,
          payment.icon,
        ),
        SizedBox(width: 32.w),
        Column(
          children: [
            TextFormat(
              "Nomor rekening :",
              34.sp,
              fontWeight: FontWeight.w500,
              fontColor: textColor2,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormat(
                  payment.accountNumber,
                  42.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: textColor2,
                ),
                SizedBox(width: 24.w),
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: payment.accountNumber),
                    ).whenComplete(() {
                      showSnackbar("Nomor rekening tersalin", true);
                    });
                  },
                  child: Icon(
                    Icons.copy_rounded,
                    size: 48.h,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 48.h),
      ],
    );
  }

  String intToRupiah(int number, {bool withSymbol = true}) {
    return NumberFormat.currency(
      locale: "id_ID",
      symbol: withSymbol ? "Rp" : "",
      decimalDigits: 0,
    ).format(number);
  }

  @override
  void dispose() {
    Get.delete<PaymentController>();
    super.dispose();
  }
}
