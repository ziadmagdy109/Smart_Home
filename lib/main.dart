import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/my_app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) {
        return const MyApp();
      },
    ),
  );
}
