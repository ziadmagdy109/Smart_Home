import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_sign_in.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/count_resend_code.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/image_reset_password.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/pin_put.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/resend_code_verify.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left, size: 30.sp),
        ),
      ),
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
                style: AppTextStyles.font20weight700,
              ),
              SizedBox(height: 10.h),
              Text(AppConstants.kVerifySendToEmail),
              SizedBox(height: 55.h),
              PinPut(),
              SizedBox(height: 56.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.homeSetupOneView);
                },
                child: ButtomSignIn(),
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
