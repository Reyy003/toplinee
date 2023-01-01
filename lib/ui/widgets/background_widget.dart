part of 'widgets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 24.w,
        right: 24.w,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.25,
            1.0,
          ],
          colors: [
            primaryColor1,
            secondaryColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
