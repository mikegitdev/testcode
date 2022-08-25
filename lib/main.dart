import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tasker/app_route/app_route_name.dart';
import 'package:tasker/app_route/app_router.dart';
import 'package:tasker/app_utils/scroll_config.dart';
import 'app_controller_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, _) {
        return GetMaterialApp(
          title: 'Test',
          debugShowCheckedModeBanner: false,
          initialBinding: AppControllerBinding(),
          initialRoute: '/${AppRouteName.createRostr}',
          getPages: AppRouter.onGeneratePage(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: child!,
              ),
            );
          },
        );
      },
    );
  }
}
