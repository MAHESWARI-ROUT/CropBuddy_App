
import 'package:cropco/screens/authentications/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currPageIndex= 0.obs;


  ///update current index when page scroll
  void updatePageindicator(index){
    currPageIndex.value =index;
  }
  


  ///jump to the specific dot selected page
  void dotNavigatorClick(index){
    currPageIndex.value = index;
    pageController.jumpTo(index);
  }


  ///update current index & jump to next page
  void nextPage(){
    if(currPageIndex.value==2){
      Get.to(() => const LoginScreen());
    }
    else{
      int page =currPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }


  ///update current index and jump to the last page
  void skipPage(){
    currPageIndex.value = 2;
    pageController.jumpTo(2);
  }
}