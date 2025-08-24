import 'package:cropco/screens/frontscreen_costumer.dart';
import 'package:cropco/screens/frontscreen_farmer.dart';
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

    return isFarmer? const FrontscreenCostumer(): const FrontScreenFarmer();
    
  }
}