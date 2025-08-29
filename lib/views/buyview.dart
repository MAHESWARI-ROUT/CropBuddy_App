import 'package:flutter/material.dart';

class Buyview extends StatefulWidget {
  const Buyview({super.key});

  @override
  State<Buyview> createState() => _BuyviewState();
}

class _BuyviewState extends State<Buyview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],

      ),
      //body: ,
    );
  }
}
