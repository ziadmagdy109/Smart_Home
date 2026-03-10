import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/view_model/home_view_model.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class AddHomeViewModel extends GetxController{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController geoNameController = TextEditingController();
  List<TextEditingController> rooms = [];

  addHome()async{
    showLoadingIndicator();
    await TuyaHomeSdkFlutter.instance.addHomeWithName(name: nameController.text, geoName: geoNameController.text,rooms: rooms.map((e) => e.text).toList()).then((value) {
    dismissLoadingIndicator();
     showSnackBar(message: 'Home Added Successfully', isError: false);
     clearData();
     Get.find<HomeViewModel>().listHomes();
    },);
  }

  clearData(){
    nameController.clear();
    geoNameController.clear();
    rooms.clear();
    update();
  }
}