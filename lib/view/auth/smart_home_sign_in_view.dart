import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/components/custom_button.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'sign_in_view.dart';
import 'widgets/container_sign_in.dart';
import 'widgets/dont_have_an_account_text.dart';
import 'widgets/image_home_and_text.dart';
import 'widgets/text_and_devider.dart';

class SmartHomeSignInView extends StatelessWidget {
  const SmartHomeSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppConstants.imageHomeAndText), context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageHomeAndText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                title: AppConstants.kSignIn,
                onPressed: () {
                  Get.to(()=> SignInView());
                },
              ),),
            SizedBox(height: 42.h),
            const TextAndDevider(),
            SizedBox(height: 15.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerSignIn(imageSocial: AppConstants.logoFacebook),
                  SizedBox(width: 15.w),
                  ContainerSignIn(imageSocial: AppConstants.logoGoogle),
                  SizedBox(width: 15.w),
                  ContainerSignIn(imageSocial: AppConstants.logoTwitter),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            const DontHaveAnAccountText(),
          ],
        ),
      ),
    );
  }
}
