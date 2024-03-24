import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/component/carousel_full_screen/carousel_view.dart';
import 'package:taskapp/features/auth/view/login_view.dart';
import 'package:taskapp/features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/fullScreenImageView',
          page: () => const FullScreenImageView(),
        ),
      ],
    );
  }
}
