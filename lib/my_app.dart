import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/core/routing/app_router.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        useInheritedMediaQuery: true, // علشان device_preview يشتغل صح
        builder: DevicePreview.appBuilder, // مهم جدًا
        locale: DevicePreview.locale(context),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.myWhite,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingView,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
