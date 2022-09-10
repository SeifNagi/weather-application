import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/controller_new.dart';
import 'package:weather_app/model/forecast_edited/weather_data_current.dart';
import 'package:weather_app/styles/colors.dart';
import 'package:weather_app/view/current_weather.dart';
import 'package:weather_app/view/daily_weather.dart';
import 'package:weather_app/widget/more_weather_info_container.dart';
import 'package:weather_app/widget/sunrise_sunset_container.dart';

import 'hourly_weather.dart';

class MainScreen extends StatelessWidget {
  final globalController = Get.put(GlobalController());

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    int? sunrise = globalController.getweatherData().current!.current.sunrise;
    int? sunset = globalController.getweatherData().current!.current.sunset;
    DateTime convertedSunrise =
        DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000, isUtc: true)
            .add(const Duration(hours: 2));
    final c = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunrise);
    final d = DateTime.parse(c);
    DateTime convertedSunset =
        DateTime.fromMillisecondsSinceEpoch(sunset! * 1000, isUtc: true)
            .add(const Duration(hours: 2));
    final set = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunset);
    final sset = DateTime.parse(set);
    bool whenRise = d.isBefore(date);
    bool whenSet = sset.isAfter(date);
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Image.asset('assets/gifs/cloudy at night.gif'),
                )
              : Container(
                  color: whenRise == false ? lightblueBackground : black,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CurrentWeather(
                          weatherCurrent: globalController
                              .getweatherData()
                              .getCurrentWeather(),
                          weatherDaily: globalController
                              .getweatherData()
                              .getDailyWeather(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white54,
                            ),
                          ),
                          child: HourlyWeather(
                            weatherHourly: globalController
                                .getweatherData()
                                .getHourlyWeather(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white54,
                            ),
                          ),
                          child: DailyWeather(
                            weatherDaily: globalController
                                .getweatherData()
                                .getDailyWeather(),
                          ),
                        ),
                      ),
                      SunContainer(
                        weatherCurrent: globalController
                            .getweatherData()
                            .getCurrentWeather(),
                      ),
                      DetailsWeatherContainer(
                        weatherCurrent: globalController
                            .getweatherData()
                            .getCurrentWeather(),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
