import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class SignInViewModel extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  submit(){
    if (formKey.currentState!.validate()) {
      Get.offAll(()=>MainView());
    }
  }
}