import 'package:flutter/material.dart';

class Buyscreen extends StatefulWidget {
  const Buyscreen({super.key});

  @override
  State<Buyscreen> createState() => _BuyscreenState();
}

class _BuyscreenState extends State<Buyscreen> {
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
