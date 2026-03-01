import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class SignUpViewModel extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  submit(){
    if (formKey.currentState!.validate()) {
      Get.offAll(()=>MainView());
    }
  }
}