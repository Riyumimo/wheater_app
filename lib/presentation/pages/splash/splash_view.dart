import 'package:wheater_app/common_libs.dart';
import 'package:wheater_app/presentation/widgets/baground_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToViewOrHomeView();
    super.initState();
  }

  void navigateToViewOrHomeView() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(context, Routes.homeView);
      // if () {

      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent),
          child: SpashViewBody()),
    );
  }
}

class SpashViewBody extends StatelessWidget {
  const SpashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BagroundWidget(
      child: Padding(
        padding: EdgeInsets.only(top: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('THIS IS LOGO'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
