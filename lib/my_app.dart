import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/services/app_binding.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/on_boarding_view.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

import 'view_model/user_view_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userCtrl = Get.put<UserViewModel>(UserViewModel() ,permanent: true);
  final AppBinding _appBinding = AppBinding();
  bool isLoading = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      setState(() {
        isLoading = true;
        userCtrl.getUserInfo().then((value) {
          isLoading = false;
          if(value != null && value.isLogin){
            isLoggedIn = true;
          }else{
            isLoggedIn = false;
          }
        },);
      });
    },);
    super.initState();
  }

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
        home: isLoading ? Center(child: LoadingIndicator(),): isLoggedIn? MainView(): OnBoardingView(),
      ),
    );
  }
}
