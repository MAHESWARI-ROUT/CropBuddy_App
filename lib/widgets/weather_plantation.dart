import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherPlantation extends StatefulWidget {
  const WeatherPlantation({super.key});

  @override
  State<WeatherPlantation> createState() => _WeatherPlantationState();
}

class _WeatherPlantationState extends State<WeatherPlantation> {

  String apiKey = "0f1fa207361da54edf04f69ccddb1730";
  String location = "Bhubaneswar"; 
  Map<String, dynamic>? weatherData;
  String cropSuggestion = "Fetching...";
  String advice = "Loading advice...";
   @override
  void initState() {
    super.initState();
    fetchWeather();
  }
  Future<void> fetchWeather() async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric");

    try {
      final response = await http.get(url);
      print(response);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weatherData = data;
          processWeatherData();
        });
      } else {
        setState(() {
          cropSuggestion = "Failed to load weather data";
          advice = "Try again later.";
        });
      }
    } catch (e) {
      setState(() {
        cropSuggestion = "Error fetching weather data";
        advice = "Check your internet connection.";
      });
    }
  }
  void processWeatherData() {
    if (weatherData == null) return;

    double temperature = weatherData!["main"]["temp"];
    int humidity = weatherData!["main"]["humidity"];
    String condition = weatherData!["weather"][0]["main"];

    if (temperature > 30 && humidity < 50) {
      cropSuggestion = "Best Crop: Maize, Sorghum";
      advice = "Increase irrigation for existing crops.";
    } else if (temperature > 20 && temperature <= 30 && humidity > 50) {
      cropSuggestion = "Best Crop: Rice, Sugarcane";
      advice = "Ensure good drainage for existing crops.";
    } else if (temperature < 20) {
      cropSuggestion = "Best Crop: Wheat, Barley";
      advice = "Use protective covers to maintain warmth.";
    } else {
      cropSuggestion = "Best Crop: Mixed farming recommended";
      advice = "Monitor soil moisture carefully.";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 100,
      child: Center(
        child: weatherData == null
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Weather in $location",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Temperature: ${weatherData!['main']['temp']}°C",
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Humidity: ${weatherData!['main']['humidity']}%",
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Condition: ${weatherData!['weather'][0]['main']}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        cropSuggestion,
                        style: const TextStyle(fontSize: 12, color: Colors.green),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        advice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}