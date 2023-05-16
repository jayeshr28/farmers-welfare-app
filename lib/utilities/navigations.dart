import 'package:flutter/material.dart';
import 'package:weather_app/news/news_home.dart';
import 'package:weather_app/screens/govSchemes.dart';

import '../commodity_rates/commodity_page.dart';

class Navigations {
  List<dynamic> list = [NewsHomePage(), GovSchemesPage(), "", CommPage()];

  Future<dynamic> NavigationHandler(BuildContext context, int i) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => list[i]));
  }

  List<String> gridImg = [
    "https://png.pngtree.com/png-clipart/20210308/original/pngtree-universal-newspaper-clip-art-png-image_5737192.jpg",
    "https://i.pinimg.com/736x/c4/10/ad/c410adb6fa95e02b2d36829e33dd9077.jpg",
    "https://www.rsipvision.com/wp-content/uploads/2018/12/Farmer-using-tablet-corn-planting.jpg",
    "https://e7.pngegg.com/pngimages/300/166/png-clipart-trader-foreign-exchange-market-commodity-trading-advisor-day-trading-bank-blue-angle-thumbnail.png"
  ];

  List<String> titles = [
    "Top Science Headlines",
    "Government Schemes",
    "Crop Prediction",
    "Commodity Rates"
  ];
}
