import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/services/api_crud_services.dart';
import 'package:smart_home/view/main_view/main_view.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class SignInViewModel extends APICrudServices{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordObscure = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  submit()async{
    if (formKey.currentState!.validate()) {
      showLoadingIndicator();
      await post(endPoint: 'auth/login', body: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'type':'client',
      },sendToken: false).then((value) {
        dismissLoadingIndicator();
        Get.offAll(()=>MainView());
       /* if(value.data['status'] == 'true'){
          Get.offAll(()=>MainView());
        }else{
          showSnackBar(message: value.data['message'] ?? 'Error occurred while creating account, Please try again later' , isError: false);
        }*/
      },);

    }
  }
}