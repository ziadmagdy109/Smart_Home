import 'package:get/get.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

import 'user_view_model.dart';

class HomeViewModel extends GetxController{
  bool isLoadingHomes = false;
  List<ThingSmartHomeModel> homes = [];

  @override
  void onInit() {
    if(Get.find<UserViewModel>().user == null){
      Get.find<UserViewModel>().getUserInfo();
    }
    super.onInit();
  }

  listHomes()async{
    isLoadingHomes = true;
    update();
    homes = await TuyaHomeSdkFlutter.instance.getHomeList();
    if(homes.isNotEmpty){
      selectedHome = homes[0];
      listDevices();
    }
    isLoadingHomes = false;
    update();
  }

  ThingSmartHomeModel? selectedHome;

  bool isLoadingDevices = false;
  List<ThingSmartDeviceModel> devices = [];

  listDevices()async {
    isLoadingDevices = true;
    update();
    devices = await TuyaHomeSdkFlutter.instance.getHomeDevices(homeId: selectedHome!.homeId);
    isLoadingDevices = false;
    update();
  }

}