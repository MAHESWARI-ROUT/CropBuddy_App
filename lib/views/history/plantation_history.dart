import 'package:cropco/widgets/history_card.dart';
import 'package:flutter/material.dart';

class PlantationHistory extends StatelessWidget {
  const PlantationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        backgroundColor: const Color(0xFF667E06),
        title: const Text('Plantation History'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              HistoryCard(
                title: 'Wheat',
                date: DateTime(2024, 12, 12),
                changecolor: false,
              ),
              
               HistoryCard(
                title: 'corn',
                date: DateTime(2024, 10, 20),
                changecolor: false,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
