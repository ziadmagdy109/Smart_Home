import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/notifications/notifications_view.dart';
import 'package:smart_home/view/profile/edit_profile_view.dart';
import 'package:smart_home/view_model/main_view_view_model.dart';

class SlideMenuView extends StatelessWidget {
  const SlideMenuView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280.w,
      backgroundColor: AppColors.myWhite,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar (Back + Title)
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.find<MainViewViewModel>().drawerController.toggle!();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.myBlack,
                      size: 20.sp,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        AppConstants.kProfile,
                        style: AppTextStyles.font18wight500weight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              // Profile header
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const AssetImage(
                      AppConstants.imageHomeProfile,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amira Mokhtar",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "amiramokhtar@gmail.com",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              // Drawer items
              _drawerItem(
                icon: "assets/images_menu/User,Profile.svg",
                title: "Personal Information",
                color: AppColors.c005,
                onTap: () {
                  Get.to(()=> EditProfileView());
                },
              ),
              _drawerItem(
                icon: "assets/images_menu/home.svg",
                title: "My Home",
                color: AppColors.c005,
                onTap: () {},
              ),
              _drawerItem(
                icon: "assets/images_menu/Setting, Edit, Filter, Gear.svg",
                title: "Settings",
                color: AppColors.c005,
                onTap: () {},
              ),
              _drawerItem(
                icon: "assets/images_menu/Bell, Notification.svg",
                title: "Notifications",
                color: AppColors.c005,
                onTap: () {
                  Get.to(()=>const NotificationsView());
                },
              ),
              _drawerItem(
                icon: "assets/images_menu/Chat, Messages, Bubble, Circle.svg",
                title: "Support",
                color: AppColors.c005,
                onTap: () {},
              ),
              _drawerItem(
                icon: "assets/images_menu/arrow-left-start-on-rectangle.svg",
                title: "Log out",
                color: AppColors.c005,
                onTap: () {},
              ),
              _drawerItem(
                icon: "assets/images_menu/trash-twoline.svg",
                title: "Delete account",
                color: AppColors.c005,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    Color color = AppColors.myBlack,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 10),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 15.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: color,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: AppColors.c244,),
      ],
    );
  }
}
