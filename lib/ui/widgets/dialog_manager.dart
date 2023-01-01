part of 'widgets.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  const DialogManager({required this.child, Key? key}) : super(key: key);

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = Get.find<DialogService>();

  @override
  void initState() {
    super.initState();

    _dialogService.registerDialogListener(
      _showMessageDialog,
      _showLoadingDialog,
      () {
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        actionsPadding: EdgeInsets.only(
          bottom: 16.h,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.clear,
              color: alertColor1,
              size: 200.h,
            ),
            TextFormat(
              message,
              30.sp,
              fontWeight: FontWeight.normal,
              fontColor: textColor2,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ActionButton(
            boxColor: greenColor,
            minimumSize: Size(0.5.sw, 0),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            text: "Tutup",
            fontColor: Colors.white,
            onTap: () {
              Get.back();
              _dialogService.dialogComplete();
            },
          ),
        ],
      ),
    );
  }

  void _showLoadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => Center(
        child: Card(
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 96.w,
              vertical: 32.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 32.h),
                const CircularProgressIndicator(),
                SizedBox(height: 24.h),
                TextFormat(
                  "Loading...",
                  32.sp,
                  fontColor: textColor2,
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
