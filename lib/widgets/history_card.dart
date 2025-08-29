import 'package:cropco/views/disease_detection.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.title,
      required this.date,
      this.icon = Icons.add_circle,
      this.color,
      required this.changecolor,
      this.height = 115,
      this.width});
  final String title;
  final DateTime date;
  final IconData? icon;
  final bool changecolor;
  final Color? color;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const DiseaseDetection(),
            ),
          );
        },
        child: Card(
          elevation: 6,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: changecolor ? Colors.lightGreen[100] : null,
              gradient: changecolor
                  ? null
                  : const LinearGradient(colors: [
                      Color(0xFF667E06),
                      Color.fromARGB(255, 140, 171, 16),
                      Color.fromARGB(255, 192, 219, 82)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          icon,
                          weight: 25,
                          size: 25,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '${date.day}/${date.month}/${date.year}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(
                        width: 18,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
