import 'package:flutter/material.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
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
