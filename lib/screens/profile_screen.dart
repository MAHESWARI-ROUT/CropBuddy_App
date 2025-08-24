import 'package:cropco/widgets/image_input.dart';
import 'package:cropco/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedImage;

  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void _pickImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageInput(
                defaultIcon: Icons.person,
                onPickImage: _pickImage,
                height: 100,
                width: 100,
                radius: 50,
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    CTextField(
                      text: 'Name',
                      icon: Icons.person,
                      controller: nameController,
                      isborder: false,
                    ),
                    const SizedBox(height: 10),
                    CTextField(
                      text: 'Email',
                      icon: Icons.email,
                      controller: emailController,
                      isborder: false,
                    ),
                    const SizedBox(height: 10),
                    CTextField(
                      text: 'Phone Number',
                      icon: Icons.phone,
                      controller: phoneController,
                      isborder: false,
                    ),
                    const SizedBox(height: 10),
                    CTextField(
                      text: 'Address',
                      icon: Icons.location_on,
                      controller: addressController,
                      isborder: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Payment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(Icons.payment_outlined),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Bank & UPI details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      height: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(Icons.wallet_rounded),
                          TextButton(
                            
                            onPressed: () {},
                            child: const Text(
                              'payment & refunds',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Activity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(Icons.favorite),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Whislist',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      height: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(Icons.share),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'shared product',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
