import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_continue.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';
import 'package:smart_home/features/auth/presentation/widgets/filllo_or_create.dart';

class HomeSetupTwoView extends StatefulWidget {
  const HomeSetupTwoView({super.key});

  @override
  State<HomeSetupTwoView> createState() => _HomeSetupTwoViewState();
}

class _HomeSetupTwoViewState extends State<HomeSetupTwoView> {
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
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Text(
                  AppConstants.kTextThreeHomeSetup,
                  style: AppTextStyles.font14weight500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25.h),
              FillloOrCreate(),
              SizedBox(height: 200.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const ButtomContinue(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
