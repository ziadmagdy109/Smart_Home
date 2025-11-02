import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_continue.dart';

class HomeSetupOneView extends StatelessWidget {
  const HomeSetupOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myGreen,
        title: Text(
          AppConstants.kHomeSetup,
          style: AppTextStyles.font18wight600weight.copyWith(
            color: AppColors.myWhite,
          ),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left, size: 30.sp, color: AppColors.myWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 50.h),
          child: Column(
            children: [
              Image.asset(AppConstants.imageHomeSetup, fit: BoxFit.cover),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: Column(
                  children: [
                    Text(
                      AppConstants.kTextOneHomeSetup,
                      style: AppTextStyles.font14weight500,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppConstants.kTextTwoHomeSetup,
                      style: AppTextStyles.font12weight400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 270.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.homeSetupTwoView);
                  },
                  child: ButtomContinue(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
