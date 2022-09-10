import 'package:weather_app/model/forecast_edited/forecast_edited.dart';
import 'package:weather_app/model/forecast_edited/weather_data_current.dart';
import 'package:weather_app/model/forecast_edited/weather_data_hourly.dart';

import 'weather_daily.dart';

class WeatherData {
  final WeatherCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDaily getDailyWeather() => daily!;
}

class ForecastData {
  final ForecastEdited? timezone;
  ForecastData({this.timezone});

  ForecastEdited getTimezone() => timezone!;
}
