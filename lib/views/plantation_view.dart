
import 'package:cropco/views/disease_detection.dart';
import 'package:cropco/views/history/plantation_history.dart';
import 'package:cropco/widgets/calendar.dart';
import 'package:cropco/widgets/gradient_appbar.dart';
import 'package:cropco/widgets/weather_plantation.dart';
import 'package:flutter/material.dart';

class PlantationView extends StatelessWidget {
  const PlantationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 47.0),
      child: Scaffold(
        extendBody: true,
        appBar: GradientAppBar(
          
          title: 'Plantation Calender',
          gradientColors: const [
           
            
            Color(0xFF6D47F7),
            Color(0xFF9A3FFD),
          ],
          isAction: true,
          iconAction: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const PlantationHistory(),
                  ),
                );
              },
              icon: const Icon(
                Icons.history,color: Colors.white,weight: 20,
              ),
            ),
          ],
        ),
       
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              SizedBox(
                //height: 250,
                child: WeatherPlantation(),
              ),
              
              
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 392,
                child: Calendar(),
              ),
              
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const DiseaseDetection(),
              ),
            );
          },
          child: Image.asset("assets/images/stetho.png"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
