import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';

class TextAndDevider extends StatelessWidget {
  const TextAndDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.myGrey,
            thickness: 0.3,
            indent: 25,
            endIndent: 8,
          ),
        ),
        Text(
          AppConstants.kSignInWith,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Divider(
            color: AppColors.myGrey,
            thickness: 0.3,
            indent: 8,
            endIndent: 25,
          ),
        ),
      ],
    );
  }
}
