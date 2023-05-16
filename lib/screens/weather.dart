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

  String getTime() {
    String time = 'day';
    DateTime today = DateTime.now();
    if (today.hour > 18 || (today.hour < 6 && today.hour >= 1))
      return time = 'night';
    else
      return time = 'day';
  }

  String getImage(int condition) {
    List<int> drizzle = [300, 321];
    List<int> rain = [500, 531];
    List<int> snow = [600, 622];
    List<int> cloudy = [801, 804];
    Map<String, int> atm = {
      'Mist': 701,
      'Smoke': 711,
      'Haze': 721,
      'Dust': 731,
      'Fog': 741
    };
    String time = getTime();
    if (condition > drizzle[0] && condition < drizzle[1]) {
      if (time == 'night') return "images/night_weather/drizzle_night.jpg";
      return 'images/day_weather/drizzle_day.jpg';
    } else if (condition > cloudy[0] && condition < cloudy[1]) {
      if (time == 'night') return 'images/night_weather/cloudy_night.jpg';
      return 'images/day_weather/cloud_day.jpg';
    } else if (condition < rain[1] && condition > rain[0]) {
      if (time == 'night') return 'images/night_weather/rain_night.jpg';
      return 'images/day_weather/rain_day.jpg';
    } else if (condition < snow[1] && condition > snow[0]) {
      if (time == 'night') return 'images/night_weather/snow_night.jpg';
      return 'images/day_weather/snow_day.jpg';
    } else if (condition == atm['Mist']!) {
      return 'images/4lQ5.gif';
    } else if (condition == atm['Smoke']!) {
      return 'images/4lQ5.gif';
    } else if (condition == atm['Dust']!) {
      return 'images/4lQ5.gif';
    } else if (condition == atm['Fog']!) {
      return 'images/4lQ5.gif';
    } else if (condition == 800) {
      if (time == 'day') return 'images/day_weather/sunny.jpg';
      return 'images/night_weather/clear_night.jpg';
    } else if (condition <= 804) {
      return 'images/day_weather/sunny.jpg';
    }
    return '';
  }

  String getConditions(int condition) {
    List<int> drizzle = [300, 321];
    List<int> rain = [500, 531];
    List<int> snow = [600, 622];
    List<int> cloudy = [801, 804];
    Map<String, int> atm = {
      'Mist': 701,
      'Smoke': 711,
      'Haze': 721,
      'Dust': 731,
      'Fog': 741
    };
    String time = getTime();
    if (condition > drizzle[0] && condition < drizzle[1]) {
      return "Drizzle";
    } else if (condition > cloudy[0] && condition < cloudy[1]) {
      return 'Cloudy';
    } else if (condition < rain[1] && condition > rain[0]) {
      return 'Rainy';
    } else if (condition < snow[1] && condition > snow[0]) {
      return 'Snowing';
    } else if (condition == atm['Mist']!) {
      return 'Mist';
    } else if (condition == atm['Smoke']!) {
      return 'Smoke';
    } else if (condition == atm['Dust']!) {
      return 'Dust';
    } else if (condition == atm['Fog']!) {
      return 'Foggy';
    } else if (condition == 800) {
      return 'Clear';
    } else {
      return 'Clear';
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

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?units=metric&lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?units=metric&q=$cityName&APPID=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
