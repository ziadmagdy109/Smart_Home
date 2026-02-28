import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'verify_code_view.dart';
import 'widgets/image_reset_password.dart';
import 'widgets/text_field_email.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppConstants.kSignIn),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageResetPassword(),
              SizedBox(height: 19.h),
              Text(
                AppConstants.kResetPassword,
                style: AppTextStyles.font20weight700.copyWith(
                    color: AppColors.c666
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                AppConstants.kEnterEmailToResetPassword,
                style: AppTextStyles.font12weight500.copyWith(
                    color: AppColors.c222
                ),
              ),
              SizedBox(height: 30.h),
              TextFieldEmail(),
              SizedBox(height: 42.h),
              CustomButton(
                title: 'Send Code',
                onPressed: () {
                 Get.to(()=>VerifyCodeView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
