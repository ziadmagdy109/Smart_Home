import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/services/api_crud_services.dart';
import 'package:smart_home/view/auth/sign_in_view.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class SignUpViewModel extends APICrudServices{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  submit()async{
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
  }
}