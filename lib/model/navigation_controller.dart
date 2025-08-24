import 'package:cropco/screens/community_screen.dart';
import 'package:cropco/screens/expense_tracker.dart';
import 'package:cropco/screens/frontscreen_farmer.dart';
import 'package:cropco/screens/plantation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // Singleton instance for easy access
  static BottomNavigationController get instance => Get.find();

  // Reactive selected index for bottom navigation
  final RxInt selectedIndex = 0.obs;

  // Screens to navigate between
  final List<Widget> screens = [
    const FrontScreenFarmer(),
    const PlantationScreen(),
    const ExpenseTracker(),
    const CommunityScreen(),
  ];
}
