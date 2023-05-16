import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/crop_prediction/data.dart';

class PredictedPage extends StatefulWidget {
  final int temp, humid, pH, rain;
  const PredictedPage(
      {Key? key,
      required this.temp,
      required this.humid,
      required this.pH,
      required this.rain})
      : super(key: key);

  @override
  State<PredictedPage> createState() => _PredictedPageState();
}

class _PredictedPageState extends State<PredictedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Predicted Crop",
        style: GoogleFonts.montserrat(),
        selectionColor: Colors.yellow,
      )),
      body: FutureBuilder(
          future: PHPdata().getData(
            widget.temp,
            widget.humid,
            (widget.pH),
            widget.rain,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 200,
                    //   width: 200,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black),
                    //       image: DecorationImage(
                    //           image: NetworkImage(CropsData().getCropImage(
                    //               snapshot.data.toString().trimLeft())),
                    //           fit: BoxFit.cover)),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Predicted Crop is : " +
                          snapshot.data.toString().trimLeft(),
                      style: GoogleFonts.montserrat(fontSize: 20),
                      selectionColor: Colors.yellow,
                    )
                  ],
                ),
              );
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
