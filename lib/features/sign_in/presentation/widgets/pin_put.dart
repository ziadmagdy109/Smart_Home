import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class PinPut extends StatelessWidget {
  const PinPut({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      showCursor: true,
      separatorBuilder: (index) => SizedBox(width: 17.w),
      onCompleted: (code) {
        print('Code entered: $code');
      },
      defaultPinTheme: PinTheme(
        width: 42.w,
        height: 42.h,
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xffDEDEDE)),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 42.w,
        height: 42.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.myGreen, width: 1.w),
        ),
      ),
    );
  }
}
