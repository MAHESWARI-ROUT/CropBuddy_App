import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class DiseaseTfliteService {
  static Interpreter? _interpreter;

  static const Map<String, String> _modelMap = {
    "Apple": "assets/models/apple_disease_model.tflite",
    "Tomato": "assets/models/tomato_disease_model.tflite",
    "Potato": "assets/models/potato_disease_model.tflite",
  };

  static const Map<String, List<String>> _classNames = {
    "Apple": [
      "Apple - Apple Scab",
      //"Apple - Black Rot",
      //"Apple - Cedar Apple Rust",
      "Apple - Healthy",
    ],
    "Tomato": [
      "Tomato - Bacterial Spot",
      "Tomato - Early Blight",
      "Tomato - Healthy",
      "Tomato - Late Blight",
      "Tomato - Leaf Mold",
      "Tomato - Septoria Leaf Spot",
      "Tomato - Spider Mites",
      "Tomato - Target Spot",
      "Tomato - Mosaic Virus",
      "Tomato - Yellow Leaf Curl Virus",
    ],
    "Potato": [
      "Potato - Early Blight",
      "Potato - Late Blight",
      "Potato - Healthy",
    ],
  };

  static Future<void> loadModel(String crop) async {
     print("Trying to load model:");
  print(_modelMap[crop]);
    _interpreter?.close();
    _interpreter = await Interpreter.fromAsset(_modelMap[crop]!);
  }

  static Map<String, dynamic> predict(File image, String crop) {
    final bytes = image.readAsBytesSync();
    final decoded = img.decodeImage(bytes)!;
    final resized = img.copyResize(decoded, width: 224, height: 224);

    final input = [
      List.generate(
        224,
        (y) => List.generate(
          224,
          (x) {
            final p = resized.getPixel(x, y);
            return [
              p.r / 255.0,
              p.g / 255.0,
              p.b / 255.0,
            ];
          },
        ),
      )
    ];

    final output = [List.filled(_classNames[crop]!.length, 0.0)];

    _interpreter!.run(input, output);

    final probs = output[0];
    int maxIdx = 0;
    double maxVal = probs[0];

    for (int i = 1; i < probs.length; i++) {
      if (probs[i] > maxVal) {
        maxVal = probs[i];
        maxIdx = i;
      }
    }

    return {
      "disease": maxVal < 0.6 ? "Uncertain" : _classNames[crop]![maxIdx],
      "confidence": (maxVal * 100).toStringAsFixed(2),
    };
  }
}
