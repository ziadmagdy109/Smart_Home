import 'package:get/get.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class UserViewModel extends GetxController {
  ThingSmartUserModel? user;

   getUserInfo()async{
     await TuyaHomeSdkFlutter.instance.getUserInfo().then((value) {
      if(value != null && value.isLogin){
        user = value;
        update();
      }
    },);
  }

  updateName({required String name,})async{
     await TuyaHomeSdkFlutter.instance.updateUserNickName(nickname: name).then((value) {
      if(value != null && value.isLogin){
        user = value;
        update();
      }
    },);
  }

  Future<bool> logout()async{
    return await TuyaHomeSdkFlutter.instance.logout().then((value) {
      user = null;
      update();
      return true;
    },);
  }

  Future<bool> deleteAccount()async{
    return await TuyaHomeSdkFlutter.instance.logout().then((value) {
      user = null;
      update();
      return true;
    },);
  }
}