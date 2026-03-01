import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';

class ListNotificationTile extends StatelessWidget {
  const ListNotificationTile({
    super.key,
    required this.image,
    required this.titleList,
    required this.subTitleList,
    required this.colorContainer,
  });
  final String image;
  final String titleList;
  final String subTitleList;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      leading: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: colorContainer,
          shape: BoxShape.circle,
        ),
        child: Center(child: SvgPicture.asset(image)),
      ),
      title: Text(titleList, style: AppTextStyles.font14weight600.copyWith(
        color: AppColors.myBlack,

      )),

      subtitle: Text(subTitleList, style: AppTextStyles.font12weight400.copyWith(
        color: AppColors.c492,

      )),
    );
  }
}
