import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class SmarHomeTextWidget extends StatelessWidget {
  const SmarHomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 95.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppConstants.kSmart,
                      style: GoogleFonts.poppins(
                        textStyle: AppTextStyles.font32bold.copyWith(
                          color: AppColors.myWhite,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: AppConstants.kHome,
                      style: GoogleFonts.poppins(
                        textStyle: AppTextStyles.font32bold.copyWith(
                          color: AppColors.myGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            AppConstants.kSubTitle1SmartHome,
            style: GoogleFonts.poppins(
              textStyle: AppTextStyles.font14weight600.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.myWhite,
              ),
            ),
          ),
          Text(
            AppConstants.kSubTitle2SmartHome,
            style: GoogleFonts.poppins(
              textStyle: AppTextStyles.font14weight600.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.myWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
