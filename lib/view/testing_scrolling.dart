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

class TestingScroll extends StatefulWidget {
  TestingScroll({Key? key}) : super(key: key);

  @override
  State<TestingScroll> createState() => _TestingScrollState();
}

class _TestingScrollState extends State<TestingScroll> {
  final globalController = Get.put(GlobalController());
  late ScrollController scrollController;
  Color backgroundColor = Colors.blue.shade300;
  bool whenRise = false;
  bool whenSet = false;
  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.position.pixels);

      if (scrollController.position.pixels > 200) {
        setState(() {
          backgroundColor = Colors.black54;
        });
      } else {
        setState(() {
          backgroundColor = Colors.blue.shade300;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    /*int? sunrise =
        globalController.getweatherData().current!.current.sunrise as int;
    int? sunset =
        globalController.getweatherData().current!.current.sunset as int;
    DateTime convertedSunrise =
        DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true)
            .add(const Duration(hours: 2));
    final c = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunrise);
    final d = DateTime.parse(c);
    DateTime convertedSunset =
        DateTime.fromMillisecondsSinceEpoch(sunset * 1000, isUtc: true)
            .add(const Duration(hours: 2));
    final set = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunset);
    final sset = DateTime.parse(set);
    whenRise = d.isBefore(date);
    whenSet = sset.isAfter(date);*/
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Container(
                  color: white,
                  child: Center(
                    child: Image.asset('assets/gifs/loading.gif'),
                  ),
                )
              : Container(
                  color: whenRise == false ? backgroundColor : black,
                  child: ListView(
                    controller: scrollController,
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
                      SizedBox(
                        height: 20,
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
                      SizedBox(
                        height: 20,
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
                      SizedBox(
                        height: 20,
                      ),
                      SunContainer(
                        weatherCurrent: globalController
                            .getweatherData()
                            .getCurrentWeather(),
                      ),
                      SizedBox(
                        height: 20,
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
