import 'package:flutter/material.dart';

class ListTextfield extends StatelessWidget {
  const ListTextfield({super.key,required this.price,required this.itemName});

  final String itemName;
  final double price;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        canRequestFocus: false,
        initialValue: itemName,
        style: const TextStyle(color: Colors.black),
        readOnly: true,
        decoration:  InputDecoration(
          suffixStyle: const TextStyle(color: Colors.black),
          suffixText: ' \$ $price',
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
