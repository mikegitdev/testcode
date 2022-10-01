import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tasker/app_route/app_route_name.dart';
import 'package:tasker/app_route/app_router.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/scroll_config.dart';
import 'package:tasker/data/local_database.dart';
import 'app_controller_binding.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(LocalDatabase.DB_NAME);
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
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.cF5F5F5,
          ),
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
