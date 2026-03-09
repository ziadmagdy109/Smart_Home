import 'package:get/get.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class UserViewModel extends GetxController {
  ThingSmartUserModel? user;

  Future<ThingSmartUserModel?> getUserInfo()async{
    return await TuyaHomeSdkFlutter.instance.getUserInfo().then((value) {
      user = value;
      update();
      return value;
    },);
  }

  Future<bool> logout()async{
    return await TuyaHomeSdkFlutter.instance.logout().then((value) {
      user = null;
      update();
      return true;
    },);
  }
}