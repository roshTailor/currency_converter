
import 'package:currency_converter/models/currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/currencyRate.dart';

Future<CurrencyRate> getRate() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?base=USD&app_id=b468b5c301764177baaa2bb72a05f248'));
  final result = currencyRateFromJson(response.body);
  return result;
}

Future<Map> getCurrencies() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?app_id=b468b5c301764177baaa2bb72a05f248'));
  final allCurrencies = currencyFromJson(response.body);
  return allCurrencies;
}

String convert(Map<String,double> exchangeRates, String amount, String baseCur,
    String finalCur) {
  String output = (double.parse(amount) /
      exchangeRates[baseCur]! *
      exchangeRates[finalCur]!)
      .toStringAsFixed(2)
      .toString();
  return output;
}
