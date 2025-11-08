import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/features/home/presentation/views/home_view.dart';
import 'package:smart_home/features/home/presentation/views/slide_menu_view.dart';

class MainScreen extends StatelessWidget {
  final ZoomDrawerController controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller,
      menuScreen: SlideMenuView(controller: controller),
      mainScreen: HomeView(controller: controller),
      borderRadius: 30.r,
      showShadow: true,
      angle: 0.0,
      slideWidth: 300.0,
      menuBackgroundColor: AppColors.myWhite,
    );
  }
}
