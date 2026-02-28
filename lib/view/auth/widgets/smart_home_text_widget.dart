import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class SmartHomeTextWidget extends StatelessWidget {
  const SmartHomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 95.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppConstants.kSmart,
                style: AppTextStyles.font32bold.copyWith(
                  color: AppColors.myWhite,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                AppConstants.kHome,
                style: AppTextStyles.font32bold.copyWith(
                  color: AppColors.myGreen,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            AppConstants.kSubTitle1SmartHome,
            style: AppTextStyles.font14weight600.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.myWhite,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            AppConstants.kSubTitle2SmartHome,
            style: AppTextStyles.font14weight500.copyWith(
              color: AppColors.myWhite,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
