import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/view/auth/home_setup_one_view.dart';
import 'package:smart_home/view_model/sign_up_view_model.dart';

import 'widgets/count_resend_code.dart';
import 'widgets/image_reset_password.dart';
import 'widgets/pin_put.dart';
import 'widgets/resend_code_verify.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key});

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final controller = Get.find<SignUpViewModel>();

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
              SizedBox(height: 30.h),
              Text(
                AppConstants.kEnterTheVerificationCode,
                style: AppTextStyles.font20weight700.copyWith(
                    color: AppColors.c666
                ),
              ),
              SizedBox(height: 10.h),
              Text(AppConstants.kVerifySendToEmail, style: AppTextStyles.font12weight500.copyWith(
                  color: AppColors.c222
              ),),
              SizedBox(height: 55.h),
              PinPut(
                controller: controller.codeController,
              ),
              SizedBox(height: 56.h),
              CustomButton(
                title: 'Verify',
                onPressed: () {
                 controller.signUp();
                },
              ),
              SizedBox(height: 10.h),
              CountResendCode(),
              SizedBox(height: 10.h),
              ResendCodeVerify(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
