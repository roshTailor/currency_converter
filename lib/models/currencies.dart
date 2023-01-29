// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Map<String, String> currencyFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String currencyToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));

// To parse this JSON data, do
//
//     final allCurrencies = allCurrenciesFromJson(jsonString);

AllCurrencies allCurrenciesFromJson(String str) => AllCurrencies.fromJson(json.decode(str));

String allCurrenciesToJson(AllCurrencies data) => json.encode(data.toJson());

class AllCurrencies {
  AllCurrencies({
    this.success,
    this.currencies,
  });

  bool? success;
  Map<String, String>? currencies;

  factory AllCurrencies.fromJson(Map<String, dynamic> json) => AllCurrencies(
        success: json["success"],
        currencies: Map.from(json["currencies"]!).map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "currencies": Map.from(currencies!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
