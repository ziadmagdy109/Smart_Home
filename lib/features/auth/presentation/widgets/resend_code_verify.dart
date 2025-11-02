import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ResendCodeVerify extends StatelessWidget {
  const ResendCodeVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppConstants.kDidntReceiveIt,
          style: AppTextStyles.font12weight500,
        ),
        Text(
          AppConstants.kResend,
          style: AppTextStyles.font12weight500.copyWith(
            color: AppColors.myGreen,
          ),
        ),
      ],
    );
  }
}
