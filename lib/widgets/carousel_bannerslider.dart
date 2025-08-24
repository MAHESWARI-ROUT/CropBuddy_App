import 'package:carousel_slider/carousel_slider.dart';
import 'package:cropco/model/banner_controller.dart';
import 'package:cropco/widgets/circular_container.dart';
import 'package:cropco/widgets/image_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselBannerslider extends StatelessWidget {
  const CarouselBannerslider({super.key,required this.banner});
  
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: banner.map((url) => ImageBanner(imageurl: url)).toList(), 
             
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banner.length; i++)
                CircularContainer(
                  radius: 20,
                  margin: const EdgeInsets.only(right: 10),
                  color: controller.carouselIndex.value == i
                      ? Colors.green.shade900
                      : Colors.lightGreen,
                  width: 20,
                  height: 5,
                )
            ],
          ),
        ),
      ],
    );
  }
}
