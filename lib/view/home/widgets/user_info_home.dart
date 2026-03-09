import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view_model/user_view_model.dart';

class UserInfoHome extends StatefulWidget {
  const UserInfoHome({super.key});

  @override
  State<UserInfoHome> createState() => _UserInfoHomeState();
}

class _UserInfoHomeState extends State<UserInfoHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: AssetImage(AppConstants.imageHomeProfile),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HI, ${Get.find<UserViewModel>().user?.username}',
                style: AppTextStyles.font14weight600.copyWith(
                  color: AppColors.myBlack,

                ),
              ),
              Text(
                AppConstants.kProfileSubName,
                style: AppTextStyles.font14weight400.copyWith(
                  color: AppColors.c780
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
