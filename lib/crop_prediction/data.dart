import 'dart:convert';

import 'package:http/http.dart' as http;

class PHPdata {
  Future<dynamic> getData(int temp, int humidity, int pH, int rain) async {
    var url = Uri.parse(
        'http://10.0.2.2/flutter_api/predict.php?temp=$temp&humidity=$humidity&pH=$pH&rain=$rain'); // Url of the website where we get the data from.
    http.Response response = await http.post(url); // Set to GET
    // http.StreamedResponse response = await request.send(); // Send request.
    // Check if response is okay
    if (response.statusCode == 200) {
      var json = await jsonDecode(jsonEncode(response.body));
      print(json);
      return json;
    } else {
      print("${response.statusCode} - Something went wrong..");
    }
  }
}
