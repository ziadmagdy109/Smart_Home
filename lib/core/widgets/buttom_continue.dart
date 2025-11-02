import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ButtomContinue extends StatelessWidget {
  const ButtomContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: AppColors.myGreen,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Text(
          AppConstants.kContinue,
          style: AppTextStyles.font16wight600weight,
        ),
      ),
    );
  }
}
