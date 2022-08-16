import 'location.dart';
import 'networking.dart';

const apiKey = 'ae15e40429e843167b856838e5a7373d';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  WeatherModel({this.temp, this.condition, this.name});
  int? temp;
  int? condition;
  String? name;

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getImage(int condition){
    if (condition < 300) {
      return 'images/dde5f4d61ca1f8b611a5014286a1cb71.gif';
    } else if (condition < 400) {
      return 'images/5573206ee160b98b8d4de3c0602b3ea5.gif';
    } else if (condition < 600) {
      return 'images/59b04114db5c3a54fa588214540c7458.gif';
    } else if (condition < 700) {
      return 'images/59b04114db5c3a54fa588214540c7458.gif️';
    } else if (condition < 800) {
      return 'images/4lQ5.gif';
    } else if (condition == 800) {
      return 'images/4lQ5.gif';
    } else if (condition <= 804) {
      return 'images/clouds.gif';
    } else {
      return 'images/f14ee0d0995b2343d02c2f600db3a958.gif';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl?units=metric&lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl?units=metric&q=$cityName&APPID=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}