import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/features/onBoarding/presentation/widgets/align_shadow_widget.dart';

class FirstOnBoardingView extends StatelessWidget {
  const FirstOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Image.asset(
            AppConstants.imageFirstOnBoarding,
            fit: BoxFit.cover,
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
                AppConstants.textOneFirstView,
                style: AppTextStyles.style28.copyWith(color: AppColors.myWhite),
              ),
              SizedBox(height: 6.h),
              Text(
                AppConstants.textTwoFirstView,
                style: AppTextStyles.style14.copyWith(
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
