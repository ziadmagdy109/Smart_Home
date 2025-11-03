import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class ContainerSignIn extends StatelessWidget {
  const ContainerSignIn({super.key, required this.imageSocial});
  final String imageSocial;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.myGreySocialMedia,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: SvgPicture.asset(imageSocial, height: 22.h, width: 22.w),
      ),
    );
  }
}
