import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapplication/providers/weather_provider.dart';
import 'package:weatherapplication/screens/home_page.dart';


void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins'
        ),
        home: HomePage(),
      ),
    )
);
