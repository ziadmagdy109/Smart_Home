import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/view/home/home_view.dart';
import 'package:smart_home/view/menu/slide_menu_view.dart';
import 'package:smart_home/view_model/main_view_view_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final controller = Get.put(MainViewViewModel());

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller.drawerController,
      menuScreen: SlideMenuView(),
      mainScreen: HomeView(),
      borderRadius: 30.r,
      showShadow: true,
      angle: 0.0,
      slideWidth: 300.0,
      menuBackgroundColor: AppColors.myWhite,
    );
  }
}
