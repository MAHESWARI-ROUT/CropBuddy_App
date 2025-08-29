import 'package:cropco/widgets/history_card.dart';
import 'package:flutter/material.dart';

class DiseaseHistory extends StatelessWidget {
  const DiseaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        title: const Text('Crop Disease History'),
        backgroundColor:const Color(0xFF667E06),
      ),
      body:  SingleChildScrollView(
        child: SizedBox(
          //decoration: BoxDecoration(color: Colors.green[300]),
         
          width: double.infinity,
          child:  Column(children: [
            HistoryCard(title: 'Citrus Diseases',date: DateTime(2025,2,12),changecolor: false,),
            const SizedBox(
              height: 5,
            ),
            HistoryCard(title: 'Black Stem Rust and Barberry',date: DateTime(2024,6,16),changecolor: false,),
          ]),
        ),
      ),
    );
  }
}
