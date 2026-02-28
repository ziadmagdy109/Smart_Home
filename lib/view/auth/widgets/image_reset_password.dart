import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_constants.dart';

class ImageResetPassword extends StatelessWidget {
  const ImageResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 260.h,
        width: 328.w,
        child: Image.asset(AppConstants.imageResetPassword),
      ),
    );
  }
}
