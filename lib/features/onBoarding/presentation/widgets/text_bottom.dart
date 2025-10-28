import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class TextBottom extends StatelessWidget {
  const TextBottom({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100.h, left: 20.w, right: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: AppTextStyles.style28.copyWith(color: Colors.white),
          ),
          SizedBox(height: 6.h),
          Text(
            text2,
            style: AppTextStyles.style14opc.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}






    // Padding(
    //   padding: EdgeInsets.only(bottom: 95.h, left: 20.w, right: 20.w),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       Align(
    //         alignment: AlignmentGeometry.bottomLeft,
    //         child: Text(text1, style: AppTextStyles.style28),
    //       ),
    //       Align(
    //         alignment: AlignmentGeometry.bottomLeft,
    //         child: Text(
    //           text2,
    //           style: AppTextStyles.style14opc,
    //           overflow: TextOverflow.ellipsis,
    //           maxLines: 2,
    //         ),
    //       ),
    //     ],
    //   ),
    // );