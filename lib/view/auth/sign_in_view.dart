import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/view/auth/reset_password_view.dart';
import 'package:smart_home/view_model/sign_in_view_model.dart';

import 'widgets/image_sign_in.dart';
import 'widgets/text_field_email.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final controller = Get.put(SignInViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppConstants.kSignIn),
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
              const ImageSignIn(),
              SizedBox(height: 19.h),
              Text(AppConstants.kSignIn, style: AppTextStyles.font20weight700.copyWith(
                color: AppColors.c666
              )),
              SizedBox(height: 8.h),
              Text(
                AppConstants.kEnterEmailAndPassword,
                style: AppTextStyles.font12weight500.copyWith(
                  color: AppColors.c222
                ),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    TextFieldEmail(),
                    SizedBox(height: 15.h),

                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(AppConstants.kPassword, style: AppTextStyles.font14weight500.copyWith(color: AppColors.myBlack.withOpacity(0.6))),
                     SizedBox(height: 10.h),
                     CustomTextField(
                       validator: (data) {
                         if (data == null || data.isEmpty) {
                           return 'Please enter your password';
                         } else if (data.length < 8) {
                           return 'Password must be at least 8 characters';
                         }
                         return null;
                       },
                       obscureText: controller.passwordObscure,
                       hint: '',
                       label: '',
                       maxLines: 1,
                       suffixIcon: IconButton(
                         onPressed: () {
                           controller.passwordObscure = !controller.passwordObscure;
                           controller.update();
                         },
                         icon: Icon(
                           size: 17.sp,
                           controller.passwordObscure
                               ? Icons.visibility_off_outlined
                               : Icons.visibility_outlined,
                           color: AppColors.myColorVisibility,
                         ),
                       ),
                     ),
                   ],
                 ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=>ResetPasswordView());
                },
                child: Text(
                  AppConstants.kForgotPassword,
                  style: AppTextStyles.font12weight500.copyWith(
                    color: AppColors.myColorForgotPassword,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                title: AppConstants.kSignIn,
                onPressed: () {
                 controller.submit();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
