import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_app_bar.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/components/custom_outlined_button.dart';
import 'package:smart_home/core/components/custom_text_field.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/profile/widgets/edit_profile_header.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            const EditProfileHeader(),
            SizedBox(height: 24.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: AppTextStyles.font14weight500.copyWith(
                  color: AppColors.c222
                )),
                SizedBox(height: 8.h),
                CustomTextField(hint: 'Mohamed Ahmed', label: 'Name'),
              ],
            ),

            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email', style: AppTextStyles.font14weight500.copyWith(
                    color: AppColors.c222
                )),
                SizedBox(height: 8.h),
                CustomTextField(hint: 'info@company.com', label: 'Email'),
              ],
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address', style: AppTextStyles.font14weight500.copyWith(
                    color: AppColors.c222
                )),
                SizedBox(height: 8.h),
                CustomTextField(hint: 'Cairo st .123', label: 'Address'),
              ],
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home Name', style: AppTextStyles.font14weight500.copyWith(
                    color: AppColors.c222
                )),
                SizedBox(height: 8.h),
                CustomTextField(hint: 'My Main Home', label: 'Home Name'),
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(title: AppConstants.kCancel, onPressed: (){
                    Get.back();
                  }),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(title: 'Save',onPressed: () {

                  },),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
