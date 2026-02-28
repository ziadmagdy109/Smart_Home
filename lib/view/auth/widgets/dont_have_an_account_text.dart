import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppConstants.kDontHaveAnAccount,
          style: AppTextStyles.font14weight400.copyWith(
            color: AppColors.myColorDontHaveAnAccount,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          " ${AppConstants.kSignUp}",
          style: AppTextStyles.font14Green400weight.copyWith(
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
