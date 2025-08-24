import 'package:flutter/material.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<Wishlistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/tomato1.png',
                  width: 152,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Center(
                  child: Text('Tomato'),
                )
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/tomato1.png',
                  width: 152,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 3,
                ),
                const Center(
                  child: Text('Tomato'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
