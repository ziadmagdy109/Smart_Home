import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/roooms/list_rooms.dart';

class ListHomeHeader extends StatelessWidget {
  const ListHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('My Homes', style: AppTextStyles.font18wight700weight),
        GestureDetector(
          onTap: () {
            Get.to(()=> ListRooms());
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.myGreyHome,
              borderRadius: BorderRadius.circular(14.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: AppColors.myGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: AppColors.myWhite, size: 24.r),
                ),
                SizedBox(width: 10.w),
                Text(
                  AppConstants.kAddNewHome,
                  style: AppTextStyles.font12weight600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
