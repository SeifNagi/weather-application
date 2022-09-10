import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/controller_new.dart';
import 'package:weather_app/model/forecast_edited/weather_data_hourly.dart';
import 'package:weather_app/styles/colors.dart';
import 'package:weather_app/styles/screen_size.dart';

class HourlyWeather extends StatelessWidget {
  final WeatherDataHourly weatherHourly;
  HourlyWeather({Key? key, required this.weatherHourly}) : super(key: key);
  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: context.height / 7,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherHourly.hourly.length > 12
                    ? 20
                    : weatherHourly.hourly.length,
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          cardIndex.value = index;
                        },
                        child: Container(
                          width: context.width / 6,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0.5, 0),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: Colors.transparent)
                              ],
                              gradient: cardIndex.value == index
                                  ? const LinearGradient(
                                      colors: [Colors.blue, Colors.black])
                                  : null),
                          child: HourlyDetails(
                            index: index,
                            cardIndex: cardIndex.toInt(),
                            temp: weatherHourly.hourly[index].temp!,
                            timestamp: weatherHourly.hourly[index].dt!,
                            weatherIcon:
                                weatherHourly.hourly[index].weather![0].icon!,
                          ),
                        ),
                      ));
                }),
          ),
        )
      ],
    );
  }
}

class HourlyDetails extends StatelessWidget {
  double temp;
  int timestamp;
  int index;
  int cardIndex;
  String weatherIcon;
  String getTime(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String x = DateFormat('j').format(time);
    return x;
  }

  HourlyDetails(
      {Key? key,
      required this.index,
      required this.cardIndex,
      required this.temp,
      required this.timestamp,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            getTime(timestamp),
            style:
                TextStyle(color: cardIndex == index ? white : Colors.white54),
          ),
        ),
        Container(
          child: Image.asset('assets/weather/$weatherIcon.png'),
          width: 40,
          height: 40,
        ),
        Container(
          child: Text(
            '${temp.round()}',
            style:
                TextStyle(color: cardIndex == index ? white : Colors.white54),
          ),
        )
      ],
    );
  }
}
