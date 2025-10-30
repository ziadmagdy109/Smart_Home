import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            "assets/images_onboarding/Rectangle 40168.png",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, right: 0.w),
          child: Image(
            image: AssetImage("assets/images_onboarding/Image (2).png"),
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
                "Automate",
                style: AppTextStyles.style28.copyWith(color: Colors.white),
              ),
              SizedBox(height: 6.h),
              Text(
                "Switch through different scenes and quick action for fast management of your home.",
                style: AppTextStyles.style14opc.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
