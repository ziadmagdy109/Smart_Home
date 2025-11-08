import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ProfileHeaderEdit extends StatelessWidget {
  const ProfileHeaderEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.myGreen, width: 2.w),
                image: const DecorationImage(
                  image: AssetImage(AppConstants.imageHomeProfile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.myGreen,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(6.r),
              child: Icon(Icons.edit, color: AppColors.myWhite, size: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text('Amira Mokhtar', style: AppTextStyles.font17wight500weight),
        SizedBox(height: 4.h),
        Text(
          'amiramokhtar@gmail.com',
          style: AppTextStyles.font12weight400.copyWith(
            color: AppColors.myGrey,
          ),
        ),
      ],
    );
  }
}
