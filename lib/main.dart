import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/current_weather.dart';
import 'package:weather_app/view/forecast_screen.dart';
import 'package:weather_app/view/location_screens.dart';
import 'package:weather_app/view/main_screen.dart';
import 'package:weather_app/view/testing_scrolling.dart';
import 'package:weather_app/widget/scroll_change_color.dart';

import 'controller/controller_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestingScroll(),
    );
  }
}
