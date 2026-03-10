import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/home/widgets/add_device_dialog.dart';

class ListDevicesHeader extends StatelessWidget {
  const ListDevicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppConstants.kDevices, style: AppTextStyles.font18wight700weight),
            GestureDetector(
              onTap: () {
                Get.dialog(AddDeviceDialog());
              },
              child: Text('Add One', style: AppTextStyles.font12weight400.copyWith(
                color: AppColors.c492,
              )),
            ),
          ],
        ),

        SizedBox(height: 4,),
        Text('Select the home to list the devices', style: AppTextStyles.font12weight400.copyWith(
            color: AppColors.c492,
          fontSize: 10
        )),
      ],
    );
  }
}
