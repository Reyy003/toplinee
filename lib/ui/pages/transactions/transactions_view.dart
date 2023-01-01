import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:topline_mobile_app/app/routes.dart';
import 'package:topline_mobile_app/app/theme.dart';
import 'package:topline_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topline_mobile_app/ui/pages/transactions/transactions_controller.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  final controller = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.homeRoute);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackWidget(onTap: () => Get.offAllNamed(AppRoutes.homeRoute)),
                  SizedBox(width: 24.w),
                  TextFormat(
                    "Riwayat Transaksi",
                    38.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Obx(
                () {
                  if (!controller.hasGetTransactions.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: primaryColor1,
                        backgroundColor: Colors.white,
                      ),
                    );
                  }
    
                  if (controller.transactions.isEmpty) {
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
                              "Belum ada transaksi",
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.transactions.length,
                      itemBuilder: ((context, index) {
                        return transactionWidget(index);
                      }),
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

  Widget transactionWidget(int index) {
    var transaction = controller.transactions[index];
    return GestureDetector(
      onTap: () {
        if (!transaction.hasSend) {
          Get.toNamed(AppRoutes.paymentRoute);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 12.h,
        ),
        margin: EdgeInsets.only(bottom: 32.h),
        decoration: BoxDecoration(
          color: textColor1,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Icon(
                Icons.swap_horiz_rounded,
                color: transaction.hasSend ? greenColor : alertColor1,
                size: 64.h,
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormat(
                    transaction.gameName,
                    36.sp,
                    fontColor: textColor2,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: 12.h),
                  TextFormat(
                    controller.inputFormat
                        .format(transaction.dateTime)
                        .toString(),
                    32.sp,
                    fontColor: textColor2,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Card(
                color: const Color(0XFFFFD700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.sh),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormat(
                    "${transaction.nominal} ${transaction.currency}",
                    34.sp,
                    fontColor: textColor2,
                    fontWeight: FontWeight.w700,
                    maxLines: 4,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TransactionsController>();
    super.dispose();
  }
}
