import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class CountResendCode extends StatelessWidget {
  const CountResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppConstants.kCountResendCode,
        style: AppTextStyles.font12weight500.copyWith(color: AppColors.myGreen),
      ),
    );
  }
}
