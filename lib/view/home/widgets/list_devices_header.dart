import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ListDevicesHeader extends StatelessWidget {
  const ListDevicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppConstants.kDevices, style: AppTextStyles.font18wight700weight),
        Text(AppConstants.kSeeAll, style: AppTextStyles.font12weight400.copyWith(
          color: AppColors.c492
        )),
      ],
    );
  }
}
