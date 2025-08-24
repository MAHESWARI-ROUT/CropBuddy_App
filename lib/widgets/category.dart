import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20,),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            
            mainAxisAlignment:MainAxisAlignment.start,
            children: [ 
              const SizedBox(width: 20,),
              Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
               Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ), Container(
                decoration: const BoxDecoration(color: Colors.green),
                padding: const EdgeInsets.all(1),
                width: 50,
                height: 50,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),],)
        ],
      ),
    );
  }
}
