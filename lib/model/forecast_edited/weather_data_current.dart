import 'weather.dart';

class WeatherCurrent {
  final Current current;
  WeatherCurrent({required this.current});
  factory WeatherCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherCurrent(current: Current.fromJson(json['current']));
}

class Current {
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;

  int? humidity;

  double? uvi;

  double? windSpeed;

  List<Weather>? weather;

  Current({
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.uvi,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
        temp: (json['temp'] as num?)?.toDouble(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp,
        'feels_like': feelsLike,
        'humidity': humidity,
        'uvi': uvi,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
