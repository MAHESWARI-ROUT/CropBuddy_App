import 'dart:io';
import 'package:cropco/data/history_store.dart';
import 'package:cropco/model/disease_record.dart';
import 'package:cropco/services/disease_tflite_service.dart';
import 'package:cropco/widgets/image_input.dart';
import 'package:flutter/material.dart';

import 'history/disease_history.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  File? _selectedImage;
  String _crop = "Potato";
  String _disease = "";
  String _confidence = "";
  bool _loading = false;

  void _pickImage(File image) {
    setState(() => _selectedImage = image);
  }

  Future<void> _detect() async {
    if (_selectedImage == null) return;

    setState(() => _loading = true);

    await DiseaseTfliteService.loadModel(_crop);
    final result =
        DiseaseTfliteService.predict(_selectedImage!, _crop);

    setState(() {
      _disease = result["disease"];
      _confidence = result["confidence"];
      _loading = false;
    });

    diseaseHistory.add(
      DiseaseRecord(
        crop: _crop,
        disease: _disease,
        confidence: _confidence,
        date: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Detection"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DiseaseHistory(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _crop,
              items: ["Apple", "Tomato", "Potato"]
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _crop = v!),
            ),
            const SizedBox(height: 10),
            ImageInput(onPickImage: _pickImage,height: MediaQuery.of(context).size.height * 0.3,
  width: MediaQuery.of(context).size.width * 0.8,
  radius: 20,
  defaultIcon: Icons.camera_alt_outlined,
  circular: false,),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _loading ? null : _detect,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text("Detect Disease"),
            ),
            const SizedBox(height: 20),
            Text("Disease: $_disease",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Confidence: $_confidence%"),
          ],
        ),
      ),
    );
  }
}
