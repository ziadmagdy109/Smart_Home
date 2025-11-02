import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/widgets/buttom_sign_in.dart';
import 'package:smart_home/features/auth/presentation/widgets/image_reset_password.dart';
import 'package:smart_home/features/auth/presentation/widgets/text_field_email.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
              SizedBox(height: 19.h),
              Text(
                AppConstants.kResetPassword,
                style: AppTextStyles.font20weight700,
              ),
              SizedBox(height: 10.h),
              Text(
                AppConstants.kEnterEmailToResetPassword,
                style: AppTextStyles.font12weight500,
              ),
              SizedBox(height: 30.h),
              TextFieldEmail(),
              SizedBox(height: 42.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.verifyCodeView);
                },
                child: ButtomSignIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
