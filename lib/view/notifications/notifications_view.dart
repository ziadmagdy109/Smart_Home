import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/view/notifications/widgets/list_notification_tile.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.kNotifications),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const ListNotificationTile(
              image: AppConstants.imagePowerNotification,
              titleList: AppConstants.kHighEnergyUseDetected,
              subTitleList: "8:30 AM",
              colorContainer: AppColors.myGreyNotifications,
            ),
            Divider(indent: 20.w, endIndent: 20.w,color: AppColors.c220,),
            const ListNotificationTile(
              image: AppConstants.imageDoorNotification,
              titleList: AppConstants.kDoorUnlocked,
              subTitleList: "9:30 AM",
              colorContainer: AppColors.myOrangeNotifications,
            ),
            Divider(indent: 20.w, endIndent: 20.w,color: AppColors.c220,),
            const ListNotificationTile(
              image: AppConstants.imageFireNotification,
              titleList: AppConstants.kSmokeDetectedInLivingRoom,
              subTitleList: "12:30 AM",
              colorContainer: AppColors.myRedNotifications,
            ),
            Divider(indent: 20.w, endIndent: 20.w,color: AppColors.c220,),

          ],
        ),
      ),
    );
  }
}
