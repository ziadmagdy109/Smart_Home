import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_constants.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/view/auth/smart_home_sign_in_view.dart';
import 'package:smart_home/view_model/on_boarding_view_model.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = Get.put(OnBoardingViewModel());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<OnBoardingViewModel>(
        builder: (controller) => Stack(
          children: [
            PageView(
              physics: const ClampingScrollPhysics(),
              onPageChanged: (index) {
                controller.onPageChanged(index);
              },
              controller: controller.pageController,
              children: controller.pages,
            ),
            Positioned(
              top: 64.h,
              left: 324.w,
              child: GestureDetector(
                onTap: () {
                  Get.offAll(() => SmartHomeSignInView());
                },
                child: Text(
                  AppConstants.kSkip,
                  style: AppTextStyles.font14weight600.copyWith(
                    color: AppColors.myWhite,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.pages.length, (index) {
                        final bool isActive = index == controller.currentIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: isActive ? 16 : 8,
                          height: isActive ? 16 : 8,
                          child: isActive
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.myGreen,
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.myGreen,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.myWhite.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        );
                      }),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (controller.currentIndex < controller.pages.length - 1) {
                          controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.offAll(() => SmartHomeSignInView());

                        }
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.myGreen,
                        ),
                        child: SizedBox(
                          width: 8.w,
                          height: 16.h,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.myWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
