import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56.h,
          width: 74.w,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: AppColors.myGreen,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: HeroIcon(HeroIcons.home, color: Colors.white, size: 30.sp),
        ),
        SizedBox(width: 14.r),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.profileEditView);
            },
            child: Container(
              padding: EdgeInsets.only(right: 15.r),
              height: 56.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: HeroIcon(
                  HeroIcons.userCircle,
                  size: 29.sp,
                  color: Color(0xff72777A),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
