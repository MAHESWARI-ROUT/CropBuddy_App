
import 'package:cropco/views/community_view.dart';
import 'package:cropco/views/expense_tracker.dart';
import 'package:cropco/views/frontview_farmer.dart';
import 'package:cropco/views/order_acceptance_view.dart';
import 'package:cropco/views/plantation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // Singleton instance for easy access
  static BottomNavigationController get instance => Get.find();

  // Reactive selected index for bottom navigation
  final RxInt selectedIndex = 0.obs;

  // Screens to navigate between
  final List<Widget> screens = [
    const FrontviewFarmer(),
    const PlantationView(),
    const OrderAcceptanceView(),
    const CommunityView(),
  ];
}
