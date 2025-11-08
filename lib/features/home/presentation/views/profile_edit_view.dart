import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/widgets/custom_app_bar.dart';
import 'package:smart_home/features/home/presentation/widgets/button_row_profile_edit.dart';
import 'package:smart_home/features/home/presentation/widgets/custom_text_field_profile_edit.dart';
import 'package:smart_home/features/home/presentation/widgets/profile_header_edit.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile Edit"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            const ProfileHeaderEdit(),
            SizedBox(height: 24.h),
            const CustomTextFieldProfileEdit(
              label: 'Name',
              hint: 'Amira Mokhtar',
            ),
            SizedBox(height: 16.h),
            const CustomTextFieldProfileEdit(
              label: 'Email',
              hint: 'amiramokhtar@gmail.com',
            ),
            SizedBox(height: 16.h),
            const CustomTextFieldProfileEdit(
              label: 'Address',
              hint: 'Taha Hussein Street, El-Nozha, Cairo',
            ),
            SizedBox(height: 16.h),
            const CustomTextFieldProfileEdit(
              label: 'Home Name',
              hint: 'Fillo House',
            ),
            SizedBox(height: 32.h),
            const ButtonRowProfileEdit(),
          ],
        ),
      ),
    );
  }
}
