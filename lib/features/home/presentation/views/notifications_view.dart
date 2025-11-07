import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';
import 'package:smart_home/features/home/presentation/widgets/list_tile_notifications.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.kNotifications),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTileNotifications(
              image: AppConstants.imagePowerNotification,
              titleList: AppConstants.kHighEnergyUseDetected,
              subTitleList: "8:30 AM",
              colorContainer: AppColors.myGreyNotifications,
            ),
            Divider(indent: 20.w, endIndent: 20.w),
            const ListTileNotifications(
              image: AppConstants.imageDoorNotification,
              titleList: AppConstants.kDoorUnlocked,
              subTitleList: "9:30 AM",
              colorContainer: AppColors.myOrangeNotifications,
            ),
            Divider(indent: 20.w, endIndent: 20.w),
            const ListTileNotifications(
              image: AppConstants.imageFireNotification,
              titleList: AppConstants.kSmokeDetectedInLivingRoom,
              subTitleList: "12:30 AM",
              colorContainer: AppColors.myRedNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
