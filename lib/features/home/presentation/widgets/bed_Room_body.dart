import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class BedRoomBody extends StatelessWidget {
  const BedRoomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        bottom: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Container(
        height: 230.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: Image.asset(
                'assets/images_home/Device_list1.png', // ضع الصورة هنا
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),
            // النصوص و الأيقونات
            Padding(
              padding: EdgeInsets.all(15.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.kMasterBedRoom,
                        style: AppTextStyles.font16wight600weight.copyWith(
                          color: AppColors.myBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        AppConstants.kIsOn,
                        style: AppTextStyles.font12weight400.copyWith(
                          color: AppColors.myBlack,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      _buildIcon(HeroIcons.sparkles),
                      SizedBox(width: 10.w),
                      _buildIcon(HeroIcons.computerDesktop),
                      SizedBox(width: 10.w),
                      _buildIcon(HeroIcons.lightBulb),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(HeroIcons iconHero) {
    return Container(
      height: 32.h,
      width: 32.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: HeroIcon(iconHero, size: 24.sp, color: Colors.grey.shade700),
    );
  }
}
