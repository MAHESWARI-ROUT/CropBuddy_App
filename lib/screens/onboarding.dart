import 'package:cropco/model/onboarding_controller.dart';
import 'package:cropco/screens/authentications/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
   Onboarding({super.key});
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageindicator,
            children: const [
              OnboardingPage(
                image: "assets/images/paddy.jpg",
                title: 'Wanna Get Orangic foods',
                subtitle: 'Here is the right place have organic live organic',
              ),
              OnboardingPage(
                image: "assets/images/paddy.jpg",
                title: 'Are you a farmer',
                subtitle:
                    'wanna sell organic items and earn profits then welcome',
              ),
              OnboardingPage(
                image: "assets/images/image 1.png",
                title: 'Easy buy,sell and delivery',
                subtitle: '24*7 customer support',
              ),
            ],
          ),
          Positioned(
            top: kToolbarHeight,
            right: 10,
            child: TextButton(
              onPressed: () => OnBoardingController.instance.skipPage(),
              child: const Text('skip'),
            ),
          ),
          Positioned(
            
            bottom: kBottomNavigationBarHeight + 20,
            left: 10,
            child: SmoothPageIndicator(
              
              controller: controller.pageController,
              onDotClicked: controller.dotNavigatorClick,
              count: 3,
              
              effect: const ExpandingDotsEffect(
                dotHeight: 6,
                dotColor: ThemeMode.dark == true
                    ? Color.fromARGB(255, 108, 98, 98)
                    : Color.fromARGB(255, 184, 180, 180),
                activeDotColor: ThemeMode.dark == true
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 76, 75, 75),
              ),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight+20,
            right: 5,
            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor:
                    ThemeMode.dark == true ? Colors.white : Colors.black,
                iconColor: ThemeMode.dark == true ? Colors.black : Colors.white,
              ),
              child: const Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Image(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          image: AssetImage(image),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
