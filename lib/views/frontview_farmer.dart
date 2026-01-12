import 'package:cropco/model/chat_screen.dart';
import 'package:cropco/views/cart_view.dart';

import 'package:cropco/views/home_body.dart';
import 'package:cropco/views/wishlist_view.dart';
import 'package:cropco/widgets/carousel_bannerslider.dart';
import 'package:cropco/widgets/home_searchbar.dart';
import 'package:cropco/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrontviewFarmer extends StatefulWidget {
  const FrontviewFarmer({super.key});

  @override
  State<FrontviewFarmer> createState() => _FrontScreenFarmerState();
}

class _FrontScreenFarmerState extends State<FrontviewFarmer> {
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'categories') {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FrontviewFarmer()),
      );
    }
  }

  void _setWishlist() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const WishlistView(),
      ),
    );
  }

  void _setCart() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const CartView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF667E06),
            title: const Text(
              'Welcome to Cropbuddy!',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_outline_outlined),
                onPressed: _setWishlist,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: _setCart,
              ),
            ],
          ),
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Container(
              decoration: BoxDecoration(color: Colors.lightGreen[100]),
              child: Column(
                children: [
                  const HomeSearchbar(color: Color(0xFF667E06)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CarouselBannerslider(
                            banner: [
                              "assets/images/b-1.jpg",
                              "assets/images/b-3.jpg",
                              "assets/images/b-4.jpg"
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(child: HomeBody()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Floating button using Stack
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const ChatScreen()),
                  );
                },
                backgroundColor: Colors.lightGreen.shade300,
                child: const Icon(Icons.support_agent, size: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
