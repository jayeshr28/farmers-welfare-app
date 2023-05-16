import 'dart:convert';

import 'package:intl/intl.dart';

class CommRecords {
  final List<Commodity>? records;

  CommRecords({required this.records});

  factory CommRecords.fromRawJson(String str) =>
      CommRecords.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommRecords.fromJson(Map<String, dynamic> json) => CommRecords(
        records: json["records"] == null
            ? null
            : List<Commodity>.from(
                json["records"].map((x) => Commodity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

class Commodity {
  final String? state;
  final String? city;
  final String? commodity;
  final int? minRate;
  final int? maxRate;
  final DateTime? arrDate;
  final int? modalRate;

  Commodity({
    this.city,
    this.commodity,
    this.minRate,
    this.maxRate,
    this.arrDate,
    this.modalRate,
    this.state,
  });

  factory Commodity.fromRawJson(String str) =>
      Commodity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(
        city: json["city"] == null ? null : json["city"],
        commodity: json["commodity"] == null ? null : json["commodity"],
        state: json["state"] == null ? null : json["state"],
        maxRate: json["max_rate"] == null ? null : json["max_rate"],
        minRate: json["min_rate"] == null ? null : json["min_rate"],
        arrDate: json["arrival_date"] == null
            ? null
            : DateTime.parse(json["arrival_date"]),
        modalRate: json["modal_rate"] == null ? null : json["modal_rate"],
      );

  Map<String, dynamic> toJson() => {
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "commodity": commodity == null ? null : commodity,
        "max_rate": maxRate == null ? null : maxRate,
        "arrival_date": arrDate == null ? null : arrDate!.toIso8601String(),
        "modal_rate": modalRate == null ? null : modalRate,
      };
  String getTime() {
    var formatter = new DateFormat('dd MMMM yyyy h:m');
    String formatted = formatter.format(arrDate!);
    return formatted;
  }

  String getDateOnly() {
    var formatter = new DateFormat('dd MMMM yyyy');
    String formatted = formatter.format(arrDate!);
    return formatted;
  }
}
