import 'package:get/get.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/service/forecast_service.dart';
import 'package:weather_app/utilities/snack_bar.dart';
/*
class ForecastController extends GetxController {
  final forecastService = Get.put(ForecastService());

  Future<Forecast> getForecastData() async {
    var res;
    try {
      res = await forecastService.getForecast();
      if (res.statusCode != 200 || res.statusCode != 201) {
        return WeatherSnackBars.errorSnackBar(message: res.data['message']);
      } else {}
    } catch (e) {
      WeatherSnackBars.errorSnackBar(message: e.toString());
    }
    return Forecast.fromJson(res.data);
  }
}
*/