import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeroIcon(
          HeroIcons.bars3BottomLeft,
          color: AppColors.myBlack,
          style: HeroIconStyle.outline,
          size: 24.r,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(6.r),
          decoration: const BoxDecoration(
            color: AppColors.myGreen,
            shape: BoxShape.circle,
          ),
          child: HeroIcon(
            HeroIcons.bellAlert,
            color: AppColors.myBlack,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}
