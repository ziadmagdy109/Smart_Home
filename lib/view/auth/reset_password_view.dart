import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/core/utils/validators.dart';
import 'package:smart_home/view_model/reset_password_view_model.dart';
import 'verify_code_view.dart';
import 'widgets/image_reset_password.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final controller =Get.put(ResetPasswordViewModel());

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppConstants.kEmail, style: AppTextStyles.font14weight500.copyWith(color: AppColors.myBlack.withOpacity(0.6))),
                  SizedBox(height: 10.h),
                  CustomTextField(hint: '', label: '',validator: emailValidator,controller: controller.emailController,),
                ],
              ),
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
