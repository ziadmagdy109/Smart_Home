import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/features/home/presentation/widgets/custom_app_bar_home.dart';
import 'package:smart_home/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:smart_home/features/home/presentation/widgets/device_card.dart';
import 'package:smart_home/features/home/presentation/widgets/devices_section.dart';
import 'package:smart_home/features/home/presentation/widgets/home_grid.dart';
import 'package:smart_home/features/home/presentation/widgets/my_home_section.dart';
import 'package:smart_home/features/home/presentation/widgets/user_info_home.dart';

class HomeView extends StatelessWidget {
  final ZoomDrawerController controller;
  HomeView({super.key, required this.controller});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            bottom: 30.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              CustomAppBarHome(controller: controller),
              SizedBox(height: 30.h),
              UserInfoHome(),
              SizedBox(height: 20.h),
              MyHomeSection(),
              SizedBox(height: 20.h),
              HomeGrid(),
              SizedBox(height: 20.h),
              DevicesSection(),
              SizedBox(height: 20.h),
              DeviceCard(title: AppConstants.kAirCondition),
              SizedBox(height: 20.h),
              DeviceCard(title: AppConstants.kLampLight),
              SizedBox(height: 20.h),
              CustomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
