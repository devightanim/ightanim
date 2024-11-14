import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ightanim/contents/theme.content.dart';
import 'package:ightanim/core/screens/splash.screen.dart';

import 'core/screens/user/user_dashboard.screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String initialRoute = "/";

    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        getPages: [
          GetPage(name: "/", page: () => const SplashScreen()),
          GetPage(name: "/home", page: () => const UserDashboard())

        ],
      ),
    );
  }
  }
