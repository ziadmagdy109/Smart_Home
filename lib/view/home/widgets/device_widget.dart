import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class DeviceWidget extends StatefulWidget {
  final String title;
  const DeviceWidget({super.key, required this.title});

  @override
  State<DeviceWidget> createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 75.h,
      width: double.infinity.w,
      duration: const Duration(milliseconds: 300),

      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isOn ? AppColors.myGreen : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // النصوص على اليسار
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: isOn ? AppColors.myWhite : AppColors.myBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                isOn ? "Connected" : "Disconnected",
                style: TextStyle(
                  color: isOn ? Colors.white70 : AppColors.c492,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          FlutterSwitch(

            height: 43.h,
            toggleSize: 24.r,
            valueFontSize: 12.r,
            borderRadius: 10.r,
            showOnOff: true,
            activeText: "ON",
            inactiveText: "Off",
            activeTextColor: AppColors.myWhite,
            inactiveTextColor: AppColors.myWhite,
            activeColor: Color(0xffD9D9D9),
            inactiveColor: Colors.grey.shade300,
            activeToggleColor: AppColors.myWhite,
            inactiveToggleColor: AppColors.myWhite,
            value: isOn,
            onToggle: (val) {
              setState(() {
                isOn = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
