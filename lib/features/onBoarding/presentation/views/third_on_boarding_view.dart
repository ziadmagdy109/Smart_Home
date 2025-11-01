import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/features/onBoarding/presentation/widgets/align_shadow_widget.dart';

class ThirdOnBoardingView extends StatelessWidget {
  const ThirdOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Image.asset(
            AppConstants.imageOneThirdOnBoarding,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, right: 0.w),
          child: Image(
            image: AssetImage(AppConstants.imageTwoThirdOnBoarding),
            width: 375.w,
            height: 390.h,
            fit: BoxFit.contain,
          ),
        ),
        AlignShadowWidget(hight: size.height * 0.5),
        Padding(
          padding: EdgeInsets.only(bottom: 100.h, left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.kTextOneThirdView,
                style: AppTextStyles.font28weight700.copyWith(
                  color: AppColors.myWhite,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                AppConstants.kTextTwoThirdView,
                style: AppTextStyles.font14weight600.copyWith(
                  color: AppColors.myWhite.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
