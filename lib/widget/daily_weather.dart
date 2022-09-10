import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/forecast_edited/weather_daily.dart';
import 'package:weather_app/styles/colors.dart';
import 'package:weather_app/styles/screen_size.dart';
import 'package:weather_app/styles/text_style.dart';

class DailyWeather extends StatelessWidget {
  final WeatherDaily weatherDaily;

  DailyWeather({Key? key, required this.weatherDaily}) : super(key: key);
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(),
          dailylist(),
        ],
      ),
    );
  }

  Widget dailylist() {
    String longday;
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount:
              weatherDaily.daily.length > 7 ? 7 : weatherDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                longday = getDay(
                                  weatherDaily.daily[index].dt,
                                ),
                                style: const TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              if (longday == 'Wednesday') ...[
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: SizedBox(
                                    height: context.height / 15,
                                    child: Image.asset(
                                      'assets/weather/${weatherDaily.daily[index].weather![0].icon}.png',
                                    ),
                                  ),
                                ),
                              ] else if (longday == 'Thursday') ...[
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: SizedBox(
                                    height: context.height / 15,
                                    child: Image.asset(
                                      'assets/weather/${weatherDaily.daily[index].weather![0].icon}.png',
                                    ),
                                  ),
                                ),
                              ] else if (longday == 'Friday') ...[
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SizedBox(
                                    height: context.height / 15,
                                    child: Image.asset(
                                      'assets/weather/${weatherDaily.daily[index].weather![0].icon}.png',
                                    ),
                                  ),
                                ),
                              ] else ...[
                                Image.asset(
                                  'assets/weather/${weatherDaily.daily[index].weather![0].icon}.png',
                                  height: context.height / 15,
                                ),
                              ],
                              Text(
                                '${weatherDaily.daily[index].temp!.max}    ${weatherDaily.daily[index].temp!.min}',
                                style: const TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
