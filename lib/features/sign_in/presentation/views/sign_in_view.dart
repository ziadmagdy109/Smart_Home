import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_sign_in.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/image_sign_in.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/text_field_email.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/text_field_password.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myWhite,
        title: Text(
          AppConstants.kSignIn,
          style: AppTextStyles.font18wight600weight,
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_left, size: 30.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 14.h,
            bottom: 40.h,
            right: 20.w,
            left: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSignIn(),
              SizedBox(height: 19.h),
              Text(AppConstants.kSignIn, style: AppTextStyles.font20weight700),
              Text(
                AppConstants.kEnterEmailAndPassword,
                style: AppTextStyles.font12weight500,
              ),
              SizedBox(height: 30.h),
              const TextFieldEmail(),
              SizedBox(height: 15.h),
              TextFieldPassword(),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.resetPasswordView);
                },
                child: Text(
                  AppConstants.kForgotPassword,
                  style: AppTextStyles.font12weight500.copyWith(
                    color: AppColors.myColorForgotPassword,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              const ButtomSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
