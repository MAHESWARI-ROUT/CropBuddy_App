
import 'package:cropco/views/front_view_costumer.dart';
import 'package:cropco/views/frontview_farmer.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  Widget build(BuildContext context) {
    
    bool isFarmer = false ;
    bool isUser = false ;
    if(isFarmer ==isUser){
      isFarmer =false;
    }

    return isFarmer? const FrontViewCostumer(): const FrontviewFarmer();
    
  }
}