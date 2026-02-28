import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/features/home/presentation/widgets/MainScreen.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class SignInViewModel extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;

  submit(){
    if (formKey.currentState!.validate()) {
      Get.offAll(()=>MainScreen());
    }
  }
}