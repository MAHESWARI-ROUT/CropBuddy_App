import 'dart:io';

import 'package:cropco/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:cropco/model/enums.dart';

class SellsView extends StatefulWidget {
  const SellsView({super.key});

  @override
  State<SellsView> createState() => _SellsViewState();
}

class _SellsViewState extends State<SellsView> {
  Category? _selectedCategory;
  File? _selectedImage;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _minquantityController = TextEditingController();
  final _maxquantityController = TextEditingController();
  void _saveItem(){
    //.....
    if(_selectedImage == null){
      return;
    }
  }
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _minquantityController.dispose();
    _maxquantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /* ImageInput(onPickImage: (image){
                _selectedImage = image;
              }),*/
              const SizedBox(
                height: 10,
              ),
              DropdownButton(
                alignment: Alignment.center,
                elevation: 10,
                hint: const Text('Select a Category that you want to sell....'),
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Enter title',
                    hintStyle: TextStyle(color: Colors.grey)),
                controller: _titleController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'enter Price of your product',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                controller: _amountController,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'min Quantity ',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: _minquantityController,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'max Quantity ',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: _maxquantityController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text('Post Now'),
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  elevation: 10.0,
                  foregroundColor: const Color.fromARGB(255, 12, 81, 1),
                  backgroundColor: const Color.fromARGB(255, 61, 180, 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
