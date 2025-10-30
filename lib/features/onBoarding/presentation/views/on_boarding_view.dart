import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/routing/routes.dart';
import 'package:smart_home/core/utils/app_colors.dart';
import 'package:smart_home/core/utils/app_text_styles.dart';
import 'package:smart_home/features/onBoarding/presentation/views/first_on_boarding_view.dart';
import 'package:smart_home/features/onBoarding/presentation/views/second_on_boarding_view.dart';
import 'package:smart_home/features/onBoarding/presentation/views/third_on_boarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> pages = [
      FirstOnBoardingView(),
      SecondOnBoardingView(),
      ThirdOnBoardingView(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: _pageController,
            children: pages,
          ),
          Positioned(
            top: 64.h,
            right: 21.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.homeSignInView);
              },
              child: Text("Skip", style: AppTextStyles.style14),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Indicators
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: pages.length,
                    effect: WormEffect(
                      strokeWidth: 3,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 5,
                      activeDotColor: AppColors.myGreen,
                      dotColor: AppColors.myWhite.withOpacity(0.3),
                    ),
                  ),
                  Spacer(),
                  // The circle behind indicator
                  IconButton(
                    onPressed: () {},
                    splashColor: AppColors.myGreen.withOpacity(0.2),
                    icon: GestureDetector(
                      onTap: () {
                        if (currentIndex < pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.homeSignInView,
                          );
                        }
                      },
                      child: Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.myGreen.withOpacity(0.9),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
