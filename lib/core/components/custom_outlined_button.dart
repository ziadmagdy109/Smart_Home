import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CustomOutlinedButton({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: Size(Get.width, 50),
        side: BorderSide(color: AppColors.myGreen),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),

      ),
      child: Text(
        title,
        style: AppTextStyles.font18wight700weight.copyWith(
          color: AppColors.myGreen,
        ),
      ),
    );
  }
}
