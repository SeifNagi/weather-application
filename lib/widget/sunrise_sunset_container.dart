import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/forecast_edited/weather_data_current.dart';
import 'package:weather_app/styles/text_style.dart';

class SunContainer extends StatelessWidget {
  final WeatherCurrent weatherCurrent;
  SunContainer({required this.weatherCurrent});
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
                Text(
                  'Sunrise',
                  style: normalWhitefont,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  getClockInUtcPlus2Hours(
                      weatherCurrent.current.sunrise as int),
                  style: boldfont,
                ),
                Image.asset('assets/gifs/sunrise.gif',
                    height: context.height / 14, width: context.width / 5),
              ],
            ),
            Column(
              children: [
                Text(
                  'Sunset',
                  style: normalWhitefont,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  getClockInUtcPlus2Hours(weatherCurrent.current.sunset as int),
                  style: boldfont,
                ),
                Image.asset('assets/gifs/sunset.gif',
                    height: context.height / 14, width: context.width / 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getClockInUtcPlus2Hours(int timeSinceEpochInSec) {
  final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
          isUtc: true)
      .add(const Duration(hours: 2));
  String dateTimeInHourMinute = DateFormat('h:mm aa').format(time);
  return dateTimeInHourMinute;
}
