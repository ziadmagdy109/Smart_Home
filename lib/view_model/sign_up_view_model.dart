import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/services/api_crud_services.dart';
import 'package:smart_home/view/auth/sign_in_view.dart';
import 'package:smart_home/view/auth/verify_code_view.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class SignUpViewModel extends APICrudServices {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController codeController = TextEditingController();

  int seconds = 60;
  Timer? timer;

  void startTimer() {
    seconds = 60;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
        update();
      }
    });
  }


  /* submit()async{
    if (formKey.currentState!.validate()) {
      showLoadingIndicator();
      await post(endPoint: 'auth/register', body: {
        'name':nameController.text.trim(),
        'email':emailController.text.trim(),
        'password':passwordController.text.trim(),
        'password_confirmation': confirmPasswordController.text.trim(),
        'phone': phoneController.text,
        'image': null,
        'type':'client',
      },sendToken: false).then((value) {
        dismissLoadingIndicator();
        if(value.status){
          Get.offAll(()=>SignInView());
          showSnackBar(message: 'Account created successfully.', isError: false);
        }else{
          showSnackBar(message: value.data['message'] ?? 'Error occurred while creating account, Please try again later' , isError: false);
        }
      },);

    }
  }*/

  sendCode() async {
    if (formKey.currentState!.validate()) {
      if(passwordController.text.trim() != confirmPasswordController.text.trim()){
        showSnackBar(message: 'Passwords do not match', isError: true);
        return;
      }else{
        showLoadingIndicator();
        await TuyaHomeSdkFlutter.instance
            .sendVerifyCodeWithUserName(
          username: emailController.text.trim(),
          countryCode: '+20',
          type: 1,
        )
            .then((value) async{

          if (value) {
            await TuyaHomeSdkFlutter.instance.updateUserNickName(
              nickname: nameController.text.trim(),
            );
            dismissLoadingIndicator();
            Get.to(() => VerifyCodeView());
          } else {
            dismissLoadingIndicator();
            showSnackBar(message: 'User already exists', isError: true);
          }
        });
      }
    }
  }

  signUp() async {
    showLoadingIndicator();
    await TuyaHomeSdkFlutter.instance
        .registerByUserName(
          username: emailController.text.trim(),
          countryCode: '+20',
          code: codeController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then((value) {
          if (value) {
            Get.offAll(() => MainView());
            showSnackBar(message: 'Account created successfully.', isError: false);
          } else {
            showSnackBar(message: 'Incorrect code', isError: true);
          }
        });
  }
}
