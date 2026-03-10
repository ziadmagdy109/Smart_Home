import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view_model/sign_in_view_model.dart';
import 'package:smart_home/view_model/sign_up_view_model.dart';

class ResendCodeVerify extends StatefulWidget {
  const ResendCodeVerify({super.key});

  @override
  State<ResendCodeVerify> createState() => _ResendCodeVerifyState();
}

class _ResendCodeVerifyState extends State<ResendCodeVerify> {
  final ctrl = Get.find<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpViewModel>(
      builder:(controller) =>  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppConstants.kDidntReceiveIt,
            style: AppTextStyles.font12weight500.copyWith(
              color: AppColors.c222
            ),
          ),
          GestureDetector(
            onTap: () {
              if(ctrl.seconds == 0){
                ctrl.startTimer();
                ctrl.sendCode();

              }
            },
            child: Text(
              AppConstants.kResend,
              style: AppTextStyles.font12weight500.copyWith(
                color: ctrl.seconds == 0 ? AppColors.myGreen: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
