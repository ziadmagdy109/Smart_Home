import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view_model/sign_up_view_model.dart';

class CountResendCode extends StatefulWidget {
  const CountResendCode({super.key});

  @override
  State<CountResendCode> createState() => _CountResendCodeState();
}

class _CountResendCodeState extends State<CountResendCode> {
  final ctrl = Get.find<SignUpViewModel>();

  @override
  void initState() {
    super.initState();
    ctrl.startTimer();
  }


  @override
  void dispose() {
    ctrl.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpViewModel>(
      builder:(controller) =>  Center(
        child: Text(
          ctrl.seconds == 0
              ? ""
              : "Resend in ${ctrl.seconds} seconds",
          style: AppTextStyles.font12weight500.copyWith(
            color: ctrl.seconds == 0 ? AppColors.myGreen : Colors.grey,
          ),
        ),
      ),
    );
  }
}