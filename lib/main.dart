import 'package:flutter/material.dart';
import 'package:smart_home/my_app.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

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
  }catch(e){
    print(e);
  }
  runApp(const MyApp());
}
