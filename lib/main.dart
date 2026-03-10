import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/my_app.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

import 'view_model/user_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 500)); // يعطي Flutter وقت للتهيئة

  try {
    await TuyaHomeSdkFlutter.instance.initSdk(
        'jycqcrkhkj3qpes3e7gh',//'sqv539paveqyfy4w5u5g',
        '3ygc7vehkyxvca73a3fhtkffvg7nfxcy',//'ac3b785abe8249bbba645fae24e6cbb5',
        'app.tecorva.smarthome',
        isDebug: true,
    );

    final userCtrl =  Get.put<UserViewModel>(UserViewModel() ,permanent: true);
    await userCtrl.getUserInfo();
  }catch(e){
    print(e);
  }
  runApp(const MyApp());
}
