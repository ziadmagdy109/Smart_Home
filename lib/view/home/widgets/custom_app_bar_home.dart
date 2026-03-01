import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/view/notifications/notifications_view.dart';
import 'package:smart_home/view_model/main_view_view_model.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.find<MainViewViewModel>().drawerController.toggle?.call();
            },
            child: HeroIcon(
              HeroIcons.bars3BottomLeft,
              color: AppColors.myBlack,
              style: HeroIconStyle.outline,
              size: 24.r,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(()=>const NotificationsView());
            },
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: const BoxDecoration(
                color: AppColors.myGreen,
                shape: BoxShape.circle,
              ),
              child: HeroIcon(
                HeroIcons.bellAlert,
                color: AppColors.myBlack,
                size: 20.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
