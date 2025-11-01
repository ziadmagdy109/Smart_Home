import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.kEmail, style: AppTextStyles.font14weight500),
        SizedBox(height: 10.h),
        TextField(
          cursorColor: AppColors.myBlack,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.myColorTextField,
                width: 0.5.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.myColorTextField,
                width: 0.5.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
