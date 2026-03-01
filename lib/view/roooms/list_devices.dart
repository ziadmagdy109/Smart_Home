import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';

class ListDevices extends StatefulWidget {
  final String image;
  const ListDevices({super.key, required this.image});

  @override
  State<ListDevices> createState() => _ListDevicesState();
}

class _ListDevicesState extends State<ListDevices> {

  final List<Map<String, dynamic>> devices = [
    {
      "title": "Air Condition",
      "subtitle": "Connected",
      "iconPath": "assets/images_home/Group 1000006166.svg",
      "colorIcon": Color(0xffF2FFE0),
    },
    {
      "title": "Lamp Light",
      "subtitle": "Connected",
      "iconPath": "assets/images_home/Group 1000006167.svg",
      "colorIcon": Color(0xffDDFFFA),
    },
    {
      "title": "Lamp Light",
      "subtitle": "Connected",
      "iconPath": "assets/images_home/Group 1000006168.svg",
      "colorIcon": Color(0xffF8F1F1),
    },
    {
      "title": "Lamp Light",
      "subtitle": "Connected",
      "iconPath": "assets/images_home/SVGRepo_iconCarrier.svg",
      "colorIcon": Color(0xffFCF6E8),
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "Device List"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                widget.image,
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Device", style: AppTextStyles.font18wight700weight),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.myGreyHome,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                            color: AppColors.myGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add, color: AppColors.myWhite, size: 24.r),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          AppConstants.kAddNewHome,
                          style: AppTextStyles.font12weight600,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            /// GridView.builder للأجهزة
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: devices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة
                crossAxisSpacing: 12, // المسافة بين الأعمدة
                mainAxisSpacing: 12, // المسافة بين الصفوف
                mainAxisExtent: 190.h,
              ),
              itemBuilder: (context, index) {
                final device = devices[index];
                return DeviceItem(
                  title: device["title"],
                  subtitle: device["subtitle"],
                  iconPath: device["iconPath"],
                  colorIcon: device["colorIcon"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final Color colorIcon;

  const DeviceItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.colorIcon,
  });

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isOn = !isOn),
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: isOn ? AppColors.myGreen : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45.w,
              width: 45.w,
              decoration: BoxDecoration(
                color: widget.colorIcon,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: SvgPicture.asset(widget.iconPath),
              ),
            ),
            SizedBox(height: 14.h),

            Text(
              widget.title,
              style: TextStyle(
                color: isOn ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              isOn ? widget.subtitle : "Disconnected",
              style: TextStyle(
                color: isOn ? Colors.white70 : AppColors.c492,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 8.h),

            Transform.scale(
              scale: 0.7.sp,
              child: Switch(
                padding: EdgeInsets.only(),
                value: isOn,
                onChanged: (value) => setState(() => isOn = value),
                activeColor: Colors.white,
                activeTrackColor: Colors.green.shade800,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: AppColors.c203,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
