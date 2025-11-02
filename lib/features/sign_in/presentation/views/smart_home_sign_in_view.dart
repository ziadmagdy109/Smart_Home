import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/widgets/buttom_sign_in.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/container_sign_in.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/dont_have_an_account_text.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/image_home_and_text.dart';
import 'package:smart_home/features/sign_in/presentation/widgets/text_and_devider.dart';

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.signInView);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const ButtomSignIn(),
              ),
            ),
            SizedBox(height: 42.h),
            const TextAndDevider(),
            SizedBox(height: 15.h),
            SingleChildScrollView(
              //تريكايه رايقه جدا
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ContainerSignIn(imageSocial: AppConstants.logoFacebook),
                  SizedBox(width: 15.w),
                  const ContainerSignIn(imageSocial: AppConstants.logoGoogle),
                  SizedBox(width: 15.w),
                  const ContainerSignIn(imageSocial: AppConstants.logoTwitter),
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
