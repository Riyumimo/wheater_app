import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/style.dart';
import 'common_libs.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        });
  }
}

AppStyle get $style => AppStyle();
