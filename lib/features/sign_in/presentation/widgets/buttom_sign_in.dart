import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ButtomSignIn extends StatelessWidget {
  const ButtomSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 54.h,
        decoration: BoxDecoration(
          color: AppColors.myGreen,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            AppConstants.kSignIn,
            style: GoogleFonts.poppins(
              textStyle: AppTextStyles.font16wight600weight,
            ),
          ),
        ),
      ),
    );
  }
}
