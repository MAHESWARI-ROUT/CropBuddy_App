import 'package:cropco/model/Navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon4,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  final String text1, text2, text3, text4;
  final IconData icon1, icon2, icon3, icon4;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Color> _navcolor = [
    Colors.lightGreen.shade200,
    Colors.white,
    Colors.lightGreen.shade200,
    Colors.white
  ];

 
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());

    return Scaffold(
      backgroundColor: Colors.transparent, 
      extendBody: true, 
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Material(
            elevation: 10, 
            color: Colors.transparent, 
            child: Container(
              decoration: BoxDecoration(
                color: _navcolor[controller.selectedIndex.value],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: NavigationBar(
                shadowColor: Colors.transparent, 
                indicatorShape: const CircleBorder(),
                backgroundColor: Colors.transparent, 
                height: 60,
                elevation: 0,

                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) {
                  controller.selectedIndex.value = index;
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle(
                      systemNavigationBarColor: _navcolor[index],
                    ),
                  );
                },

                destinations: [
                  NavigationDestination(icon: Icon(widget.icon1), label: widget.text1),
                  NavigationDestination(icon: Icon(widget.icon2), label: widget.text2),
                  NavigationDestination(icon: Icon(widget.icon3), label: widget.text3),
                  NavigationDestination(icon: Icon(widget.icon4), label: widget.text4),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
