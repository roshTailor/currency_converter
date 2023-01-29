// To parse this JSON data, do
//
//     final convert = convertFromJson(jsonString);

import 'dart:convert';

Convert convertFromJson(String str) => Convert.fromJson(json.decode(str));

String convertToJson(Convert data) => json.encode(data.toJson());

class Convert {
  Convert({
    this.success,
    this.query,
    this.info,
    this.result,
  });

  bool? success;
  Query? query;
  Info? info;
  double? result;

  factory Convert.fromJson(Map<String, dynamic> json) => Convert(
        success: json["success"],
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        result: json["result"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "query": query?.toJson(),
        "info": info?.toJson(),
        "result": result,
      };
}

class Info {
  Info({
    this.timestamp,
    this.quote,
  });

  int? timestamp;
  double? quote;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        timestamp: json["timestamp"],
        quote: json["quote"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "quote": quote,
      };
}

class Query {
  Query({
    this.from,
    this.to,
    this.amount,
  });

  String? from;
  String? to;
  int? amount;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        from: json["from"],
        to: json["to"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "amount": amount,
      };
}
