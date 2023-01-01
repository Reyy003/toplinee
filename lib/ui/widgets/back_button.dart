part of 'widgets.dart';

class BackWidget extends StatelessWidget {
  final Function()? onTap;

  const BackWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF30052B).withOpacity(0.26),
        elevation: 2,
        minimumSize: Size(96.w, 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
              vertical: 16.h,
            ),
      ),
      child: const Icon(Icons.arrow_back),
    );
  }
}
