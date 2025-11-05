import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home/core/utils/app_colors.dart';

class DeviceCard extends StatefulWidget {
  final String title;

  const DeviceCard({super.key, required this.title});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
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
              const SizedBox(height: 4),
              Text(
                isOn ? "Connected" : "Disconnected",
                style: TextStyle(
                  color: isOn ? Colors.white70 : Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          RotatedBox(
            quarterTurns: -1,
            child: FlutterSwitch(
              width: 70.w,
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
          ),
        ],
      ),
    );
  }
}
