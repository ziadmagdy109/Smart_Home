import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/view/home/widgets/custom_app_bar_home.dart';
import 'package:smart_home/view/home/widgets/custom_nav_bar.dart';
import 'package:smart_home/view/home/widgets/device_widget.dart';
import 'package:smart_home/view/home/widgets/list_devices_header.dart';
import 'package:smart_home/view/home/widgets/list_home_grid.dart';
import 'package:smart_home/view/home/widgets/list_home_header.dart';
import 'package:smart_home/view/home/widgets/user_info_home.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key,});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              CustomAppBarHome(),
              SizedBox(height: 30.h),
              UserInfoHome(),
              SizedBox(height: 30.h),
              ListHomeHeader(),
              SizedBox(height: 20.h),
              ListHomeGrid(),
              SizedBox(height: 30.h),
              ListDevicesHeader(),
              SizedBox(height: 20.h),
              DeviceWidget(title: AppConstants.kAirCondition),
              SizedBox(height: 20.h),
              DeviceWidget(title: AppConstants.kLampLight),
              SizedBox(height: 20.h),
              CustomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
