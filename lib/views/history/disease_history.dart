import 'package:cropco/data/history_store.dart';
import 'package:cropco/widgets/history_card.dart';
import 'package:flutter/material.dart';


class DiseaseHistory extends StatelessWidget {
  const DiseaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detection History")),
      body: ListView.builder(
        itemCount: diseaseHistory.length,
        itemBuilder: (ctx, i) {
          final item = diseaseHistory[i];
          return HistoryCard(
            title: "${item.crop} - ${item.disease}",
            date: item.date,
            changecolor: false,
          );
        },
      ),
    );
  }
}
