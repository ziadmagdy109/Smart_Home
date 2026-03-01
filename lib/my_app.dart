import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/services/app_binding.dart';
import 'package:smart_home/view/on_boarding/on_boarding_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppBinding _appBinding = AppBinding();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => GetMaterialApp(
        initialBinding: _appBinding,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.myWhite,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: OnBoardingView(),
      ),
    );
  }
}
