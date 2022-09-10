import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/styles/screen_size.dart';
import 'package:weather_app/model/forecast_edited/weather_daily.dart';
import 'package:weather_app/model/forecast_edited/weather_data_current.dart';
import 'package:weather_app/styles/text_style.dart';
import 'package:weather_app/view/testing_scrolling.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherCurrent weatherCurrent;
  final WeatherDaily weatherDaily;

  CurrentWeather({
    Key? key,
    required this.weatherCurrent,
    required this.weatherDaily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    int? sunrise = weatherCurrent.current.sunrise;
    DateTime convertedSunrise =
        DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000, isUtc: true)
            .add(const Duration(hours: 2));

    bool when = convertedSunrise.isBefore(date);
    bool clearCondition =
        weatherCurrent.current.weather![0].main == 'Clear ' && when == false;
    bool rainCondition =
        weatherCurrent.current.weather![0].main == 'Rain ' && when == false;
    bool cloudCondition =
        weatherCurrent.current.weather![0].main == 'Clouds ' && when == false;
    bool snowCondition = weatherCurrent.current.weather![0].main == 'Snow ';

    int? sunset = weatherCurrent.current.sunset;

    final c = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunrise);
    final d = DateTime.parse(c);
    DateTime convertedSunset =
        DateTime.fromMillisecondsSinceEpoch(sunset! * 1000, isUtc: true)
            .add(const Duration(hours: 2));
    final set = DateFormat('yyyy-MM-dd HH:MM:ss').format(convertedSunset);
    final sset = DateTime.parse(set);
    bool whenRise = d.isBefore(date);
    bool whenSet = date.isAfter(sset);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Text('set:$whenSet'),
        Text('rise:$whenRise'),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(weatherCurrent.current.temp!.round())}\u00b0',
              style: bigWhitefont,
            ),
            if (weatherCurrent.current.weather![0].main == 'Clear' &&
                whenRise == true &&
                whenSet == false) ...[
              Image.asset(
                'assets/gifs/sunny.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Clear' &&
                whenRise == false &&
                whenSet == true) ...[
              Image.asset(
                'assets/gifs/moon.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Clouds' &&
                whenRise == true &&
                whenSet == false) ...[
              Image.asset(
                'assets/gifs/cloudy at day.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Clouds' &&
                whenRise == false &&
                whenSet == true) ...[
              Image.asset(
                'assets/gifs/cloudy at night.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Rain' &&
                whenRise == true &&
                whenSet == false) ...[
              Image.asset(
                'assets/gifs/raining at day.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Rain' &&
                whenRise == false &&
                whenSet == true) ...[
              Image.asset(
                'assets/gifs/raining at night.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Snow' &&
                whenRise == true &&
                whenSet == false) ...[
              Image.asset(
                'assets/gifs/snowing at night.gif',
                width: context.width / 3,
              ),
            ] else if (weatherCurrent.current.weather![0].main == 'Snow' &&
                whenRise == false &&
                whenSet == true) ...[
              Image.asset(
                'assets/gifs/snowing at night.gif',
                width: context.width / 3,
              ),
            ] else ...[
              Container(),
            ],
          ],
        ),
        Text(
          "Al'Atabah",
          style: Whitefont,
        ),
        Text(
          '${weatherCurrent.current.weather![0].description}',
          style: normalWhitefont,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${(weatherDaily.daily[0].temp!.max)}\u00b0 / ${(weatherDaily.daily[0].temp!.min)}\u00b0 Feels like ${(weatherCurrent.current.feelsLike!.round())}\u00b0 ',
          style: normalWhitefont,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          DateFormat('E,h:mm a').format(DateTime.now()),
          style: normalWhitefont,
        ),
      ],
    );
  }
}
/* Text('${weatherCurrent.current.temp!.round()}'),
        Text(
            '${weatherDaily.daily[0].temp!.max} / ${weatherDaily.daily[0].temp!.min}'),
        Text('${weatherCurrent.current.weather![0].description}'),*/