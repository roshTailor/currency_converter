// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Map<String, String> currencyFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String currencyToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
