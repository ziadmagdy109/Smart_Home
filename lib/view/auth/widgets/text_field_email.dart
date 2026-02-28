import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
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
        Text(AppConstants.kEmail, style: AppTextStyles.font14weight500.copyWith(color: AppColors.myBlack.withOpacity(0.6))),
        SizedBox(height: 10.h),
        CustomTextField(hint: '', label: '',validator:  (data) {
          if (data == null || data.isEmpty) {
            return "Please enter your email";
          }
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

          if (!emailRegex.hasMatch(data)) {
            return 'Please enter a valid email address';
          }
          return null;
        },),
      ],
    );
  }
}
