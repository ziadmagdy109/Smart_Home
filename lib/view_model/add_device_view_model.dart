import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/view_model/home_view_model.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

class AddDeviceViewModel extends GetxController{
  List<ThingSmartDeviceModel> discoveredDevices = [];

  discoverDevices(){
    TuyaHomeSdkFlutter.instance.discoverDevices().listen(
          (device) {
            discoveredDevices.add(device);
            update();
      },
      onError: (error) {
        debugPrint("Error discovering devices: $error");
      },
    );
  }

  String ssid = '';

  getWifiInfo()async{
    showLoadingIndicator();
    await TuyaHomeSdkFlutter.instance.getWifiSsid().then((value) {
      dismissLoadingIndicator();
      ssid = value??'Unknown Network';
      update();
      print(value);
    },);
    }

  final TextEditingController password = TextEditingController();

  addDevice(ThingSmartDeviceModel device)async{
    await TuyaHomeSdkFlutter.instance.startConfigBLEWifiDevice(
      homeId: Get.find<HomeViewModel>().selectedHome!.homeId,
      deviceProductId: device.productId,
      ssid: ssid,
      password: password.text,
      deviceUuid: device.uuid,
    ).then((value) {
      Get.back();

      Get.find<HomeViewModel>().listDevices();
    },);
    }
}