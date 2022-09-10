import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'package:weather_app/model/forecast_edited/weather_data_current.dart';
import 'package:weather_app/styles/text_style.dart';

class DetailsWeatherContainer extends StatelessWidget {
  final WeatherCurrent weatherCurrent;
  DetailsWeatherContainer({required this.weatherCurrent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white54,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/gifs/uv index.gif',
                    height: context.height / 14, width: context.width / 7),
                Text(
                  'UV index',
                  style: boldfont,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${weatherCurrent.current.uvi}',
                  style: normalGreyFont,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/gifs/wind.gif',
                    height: context.height / 14, width: context.width / 7),
                Text(
                  'Wind',
                  style: boldfont,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${(weatherCurrent.current.windSpeed! * 3.6).round()}km/h',
                  style: normalGreyFont,
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/gifs/humidity.gif',
                    height: context.height / 14, width: context.width / 7),
                Text(
                  'Humidity',
                  style: boldfont,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('${weatherCurrent.current.humidity}%',
                    style: normalGreyFont),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
