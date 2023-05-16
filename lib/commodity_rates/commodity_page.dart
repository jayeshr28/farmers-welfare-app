import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/commodity_rates/data_gov_api.dart';

import '../utilities/constants.dart';

class CommPage extends StatefulWidget {
  const CommPage({Key? key}) : super(key: key);

  @override
  State<CommPage> createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {
  late String commodity;
  late String rate;
  late String city;
  late var commData;
  var cityName = "";
  Future getCommData() async {
    commData = await DataGovApi().fetchRates();
    commodity = await commData.toString();

    // rate = commData[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getCommData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: DataGovApi().fetchRates(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Commodity Rates",
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: kTextFieldInputDecoration,
                          onChanged: (value) {
                            cityName = value;
                          },
                        ),
                      ),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       fixedSize: Size(200, 50),
                      //     ),
                      //     onPressed: () async {
                      //       await DataGovApi().fetchRates(city: cityName);
                      //       setState(() {
                      //         getCommData();
                      //       });
                      //     },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Text("Search"),
                      //         Icon(Icons.search),
                      //       ],
                      //     )),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        itemCount: 30,
                        itemBuilder: (context, index) => Container(
                          height: 210,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(3)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "State : " +
                                    commData[index]['state'].toString(),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              Text(
                                  "District : " +
                                      commData[index]['district'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Market : " +
                                      commData[index]['market'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Commodity : " +
                                      commData[index]['commodity'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Variety : " +
                                      commData[index]['variety'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Arrival Date : " +
                                      commData[index]['arrival_date']
                                          .toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Minimum Price : " +
                                      commData[index]['min_price'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Maximum Price : " +
                                      commData[index]['max_price'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                              Text(
                                  "Modal Price : " +
                                      commData[index]['modal_price'].toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            print(snapshot.error);
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}
