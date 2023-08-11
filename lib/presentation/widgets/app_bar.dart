import '../../common_libs.dart';
import 'back_arror_widget.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key, required this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const CustomBackButton(),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
    );
  }
}
