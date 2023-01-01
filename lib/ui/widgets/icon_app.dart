part of 'widgets.dart';

class IconApp extends StatelessWidget {
  final double? size;
  const IconApp({this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size ?? 50),
      child: SizedBox(
        width: size ?? 200.w,
        height: size ?? 200.w,
        child: Image.asset('${Global.icons}/app.png'),
      ),
    );
  }
}