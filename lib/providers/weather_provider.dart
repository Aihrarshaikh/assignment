import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../api/constraints.dart';
import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider() {
    fetchData();
  }
  setCity(String cityy){
    city = cityy;
    fetchData();
    notifyListeners();
  }
  bool loading = false;
  bool valid = false;
  String city = "india";
  late Weather _weather;

  Weather get allData => _weather;
  setWeather(Weather data) {
    _weather=(data);
    notifyListeners();
  }

  Future fetchData() async {
    loading = true;
    Weather weatherData;
    var response = await http.get(Uri.parse('http://api.weatherstack.com/current?access_key=$api_key&query=$city'));
    if (response.statusCode == 200) {
      var weatherDecode = json.decode(response.body);
      if(weatherDecode['success']==false){
        valid= false;
      }else{
        valid = true;
      }
      weatherData=Weather.fromJson(weatherDecode);
      setWeather(weatherData);
      loading = false;
      return weatherData;
    } else {
      loading = true;
      notifyListeners();
      throw Exception('Failed to load data!');
    }
  }
}
