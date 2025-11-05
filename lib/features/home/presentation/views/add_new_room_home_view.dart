import 'package:flutter/material.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';

class AddNewRoomHomeView extends StatelessWidget {
  const AddNewRoomHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: AppConstants.kDeviceList));
  }
}
