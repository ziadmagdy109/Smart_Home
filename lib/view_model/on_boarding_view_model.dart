import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/view/on_boarding/first_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/second_on_boarding_view.dart';
import 'package:smart_home/view/on_boarding/third_on_boarding_view.dart';

class OnBoardingViewModel extends GetxController{
  final PageController pageController = PageController();
  int currentIndex = 0;

  List<Widget> pages = [
    FirstOnBoardingView(),
    SecondOnBoardingView(),
    ThirdOnBoardingView(),
  ];

  onPageChanged(int index){
    currentIndex = index;
    update();
  }
}