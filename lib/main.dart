import 'dart:io';

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
       Platform.isIOS? 'jycqcrkhkj3qpes3e7gh': 'a84xq5hqc4era7m7dcnj',
      Platform.isIOS? '3ygc7vehkyxvca73a3fhtkffvg7nfxcy' : 'wcfpyg55sc5m4j4ujva5q3m7nq4jx9gh',
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
