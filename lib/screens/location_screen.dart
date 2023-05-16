import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/crop_prediction/crop_predict_ui.dart';
import 'package:weather_app/screens/weather.dart';

import '../utilities/navigations.dart';
import 'city.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temperature;
  late int humidity;
  late String cityName;
  late String weatherIcon;
  late String weatherMsg;
  late String weatherImage;
  late String weatherCondition;
  late String time;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        time = '';
        humidity = 0;
        weatherIcon = 'Error';
        weatherMsg = 'Unable to get weather data';
        weatherImage = 'sorry';
        cityName = '';
        weatherCondition = 'Try again after some time';
        return;
      }
      dynamic temp = weatherData['main']['temp'];
      dynamic humid = weatherData['main']['humidity'];
      humidity = humid.toInt();
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      time = weatherModel.getTime();
      weatherMsg = weatherModel.getMessage(temperature);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherImage = weatherModel.getImage(condition);
      weatherCondition = weatherModel.getConditions(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(weatherImage), fit: BoxFit.cover)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () async {
                            var weatherData =
                                await weatherModel.getLocationWeather();
                            updateUI(weatherData);
                          },
                          child: Icon(
                            Icons.add_location,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ),
                            );
                            if (typedName != null) {
                              var weatherData =
                                  await weatherModel.getCityWeather(typedName);
                              updateUI(weatherData);
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '$temperature°c ' '',
                              style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  color: time == 'day'
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  ' $weatherCondition ',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: time == 'day'
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                Text(
                                  '$weatherIcon' '',
                                  style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      color: time == 'day'
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                Text(
                                  " Humidity $humidity",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: time == 'day'
                                          ? Colors.black
                                          : Colors.white),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              ' in $cityName' '',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: time == 'day'
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              height: 50,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red.withOpacity(0.2),
              ),
              child: Center(
                  child: Text("PM-Kisan Helpline No. 155261 / 011-24300606")),
            ),
            Container(
              height: 400,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25),
                  padding: const EdgeInsets.all(20),
                  itemCount: 4,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => NewsHomePage()));
                        if (i == 2)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CropPredict(
                                      temp: temperature, humid: humidity)));
                        else
                          Navigations().NavigationHandler(ctx, i);
                      },
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(Navigations().gridImg[i]),
                                radius: 35,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Navigations().titles[i],
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            //
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 CropPredict(temp: temperature, humid: humidity)));
            //   },
            //   child: Container(
            //     height: 50,
            //     margin: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.cyan.withOpacity(0.2),
            //     ),
            //     child: Center(child: Text("Crop Yield Predicition")),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            //
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         fixedSize: Size(160, 50), backgroundColor: Colors.black),
            //     onPressed: () {
            //       Navigator.push(
            //           context, MaterialPageRoute(builder: (ctx) => CommPage()));
            //     },
            //     child: Text("Commodity rates")),
            // Padding(
            //   padding: EdgeInsets.only(left: 15.0, top: 20),
            //   child: Text(
            //     '$weatherMsg in $cityName!',
            //     textAlign: TextAlign.left,
            //     style: GoogleFonts.poppins(fontSize: 25),
            //   ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.motorcycle),
      //       label: 'test',
      //     ),
      //   ],
      //   // onTap: (i) {
      //   //   Navigator.push(
      //   //       context,
      //   //       MaterialPageRoute(
      //   //           builder: (context) =>
      //   //               DiseaseDetectionPage(pageTitle: 'test')));
      //   // }
      // ),
    );
  }
}
