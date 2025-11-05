import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_continue.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';

class HomeSetupOneView extends StatelessWidget {
  const HomeSetupOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.kHomeSetup),
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
