import 'dart:convert';

import 'package:http/http.dart' as http;

class DataGovApi {
  Future<List<dynamic>> fetchRates({String city = ""}) async {
    var url =
        "https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd0000010fc3dde120f34f1478fbae78e934a773&format=json&offset=0&limit=50";

    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = await json.decode(response.body)['records'];
        print(data);
        var prices =
            await data.map((item) => Map<String, dynamic>.from(item)).toList();
        return prices;
        // do something with the prices data
      }
    } catch (e) {
      throw Exception("Failed to load commodities");
      print(e);
    }
    List<dynamic> list = [];
    return list;
  }
}
