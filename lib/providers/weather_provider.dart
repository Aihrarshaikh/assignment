import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../api/constraints.dart';
import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // Private variables
  String _city = "";  // The city for which weather data is fetched
  Weather? _weather;  // The weather data
  bool _loading = false;  // Indicates if data is being loaded
  bool _valid = false;  // Indicates if the fetched data is valid
  String? _errorMessage;  // Stores error messages if any

  // Getters for private variables
  String get city => _city;
  Weather? get allData => _weather;
  bool get loading => _loading;
  bool get valid => _valid;
  String? get errorMessage => _errorMessage;

  // Sets the city and fetches weather data for the new city
  setCity(String cityy) {
    _city = cityy;
    fetchData();
  }

  // Sets the weather data and notifies listeners
  setWeather(Weather data) {
    _weather = data;
    notifyListeners();
  }

  // Fetches weather data from the API
  Future fetchData() async {
    _loading = true;  // Set loading to true
    _errorMessage = null;  // Clear any previous error messages
    notifyListeners();  // Notify listeners about the change

    try {
      // API call to fetch weather data
      var response = await http.get(Uri.parse('http://api.weatherstack.com/current?access_key=$api_key&query=$_city'));

      if (response.statusCode == 200) {  // Check if the response is successful
        var weatherDecode = json.decode(response.body);  // Decode the JSON response
        print(weatherDecode);
        if (weatherDecode['success'] == false) {  // Check if the API indicates failure
          _valid = false;
          // Check the type of error and set an appropriate error message
          if (weatherDecode['error']['type'] == 'request_failed') {
            _errorMessage = "Try again with a different location, no data available for '$_city'";
          } else {
            _errorMessage = weatherDecode['error']['info'];
          }
        } else {
          _valid = true;
          Weather weatherData = Weather.fromJson(weatherDecode);  // Parse the weather data
          setWeather(weatherData);  // Set the weather data
        }
      } else {  // Handle unsuccessful response
        _valid = false;
        _errorMessage = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {  // Handle exceptions
      _valid = false;
      _errorMessage = 'Failed to load data: Possibly an internet error';
    }

    _loading = false;  // Set loading to false
    notifyListeners();  // Notify listeners about the change
  }
}
