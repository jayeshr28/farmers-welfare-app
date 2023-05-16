import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/crop_prediction/data.dart';
import 'package:weather_app/crop_prediction/predicted_page.dart';

class CropPredict extends StatefulWidget {
  final int temp, humid;
  const CropPredict({Key? key, required this.temp, required this.humid})
      : super(key: key);

  @override
  State<CropPredict> createState() => _CropPredictState();
}

class _CropPredictState extends State<CropPredict> {
  TextEditingController pHController = new TextEditingController();
  TextEditingController rainController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  late String mesg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(19),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Crop Yield Prediction",
                  style: GoogleFonts.poppins(fontSize: 30),
                )),
                SizedBox(height: 30),
                Text(
                  "Temperature in degree celsius: " + widget.temp.toString(),
                  style: GoogleFonts.play(fontSize: 20),
                ),
                SizedBox(height: 30),
                Text(
                  "Humidity in (g.m-3) : " + widget.humid.toString(),
                  style: GoogleFonts.play(fontSize: 20),
                ),
                SizedBox(height: 30),
                Text(
                  "Rainfall in mm: ",
                  style: GoogleFonts.play(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: rainController,
                  decoration: InputDecoration(
                    hintText: 'Rainfall',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "PH in range of 0 - 14: ",
                  style: GoogleFonts.play(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: pHController,
                  decoration: InputDecoration(
                    hintText: 'pH',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PredictedPage(
                                    temp: widget.temp,
                                    humid: widget.humid,
                                    pH: int.parse(pHController.text),
                                    rain: int.parse(rainController.text))));
                        mesg = await PHPdata().getData(
                            widget.temp,
                            widget.humid,
                            int.parse(pHController.text),
                            int.parse(rainController.text));
                      },
                      child: Text(
                        "Predict",
                        style: GoogleFonts.montserrat(color: Colors.black),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
