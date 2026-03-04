import 'package:flutter/material.dart';
import 'package:smart_home/my_app.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await TuyaHomeSdkFlutter.instance.initSdk(
        'cayet7d9mfnw3mkpckf7',
        'b7eb3db125a74491943c6a6ce934b077',
        'app.tecrova.smarthome',
        isDebug: true
    );
  }catch(e){
    print(e);
  }
  runApp(const MyApp());
}
