import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/loading_indicator.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view_model/user_view_model.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserViewModel>(
      builder: (controller) =>controller.user == null? LoadingIndicator(): Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.myGreen, width: 2.w),
                  image: DecorationImage(
                    image: controller.user!.headIconUrl == null?  AssetImage(AppConstants.imageHomeProfile): NetworkImage(controller.user!.headIconUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.myGreen,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(6.r),
                child: Icon(Icons.edit, color: AppColors.myWhite, size: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text('${controller.user!.nickname}', style: AppTextStyles.font17wight500weight.copyWith(
            color: AppColors.c005
          )),
          SizedBox(height: 4.h),
          Text(
            '${controller.user!.username}',
            style: AppTextStyles.font12weight400.copyWith(
              color: AppColors.c621,
            ),
          ),
        ],
      ),
    );
  }
}
