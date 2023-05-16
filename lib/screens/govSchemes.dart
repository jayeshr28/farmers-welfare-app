import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utilities/schemesData.dart';

class GovSchemesPage extends StatelessWidget {
  const GovSchemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              "Government's Provided\nTop Schemes",
              style: GoogleFonts.poppins(fontSize: 25),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 1000,
            child: ListView.builder(
              itemCount: 14,
              itemBuilder: (context, i) {
                return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black38)),
                    height: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                GovSchemes.title[i],
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("${GovSchemes.date[i]}",
                                style: GoogleFonts.montserrat(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage("images/farmer.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                        // TextButton(onPressed: () {}, child: Text("Know More!")),
                      ],
                    ));
              },
            ),
          ),
        ],
      )),
    ));
  }
}
