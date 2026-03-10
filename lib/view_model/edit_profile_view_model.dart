import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/view_model/user_view_model.dart';

class EditProfileViewModel extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  initData(){
    nameController.text = Get.find<UserViewModel>().user!.nickname;
    emailController.text =  Get.find<UserViewModel>().user!.username;
   update();
  }

  updateProfile(){
    showLoadingIndicator();
    Get.find<UserViewModel>().updateName(name: nameController.text,).then((_){
      showSnackBar(message: 'Profile Updated Successfully.', isError: false);
      dismissLoadingIndicator();
    });
  }
}