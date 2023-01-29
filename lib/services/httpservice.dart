import 'dart:convert';

import 'package:currency_converter/models/currencies.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../apiUtils.dart';
import '../models/convert.dart';
import '../models/currencyRate.dart';

Future<CurrencyRate> getRate() async {
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?base=USD&app_id=b468b5c301764177baaa2bb72a05f248'));
  final result = currencyRateFromJson(response.body);
  return result;
}

Future<Map> getCurrencies() async {
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=b468b5c301764177baaa2bb72a05f248'));
  final allCurrencies = currencyFromJson(response.body);
  return allCurrencies;
}

String convert(Map<String, double> exchangeRates, String amount, String baseCur, String finalCur) {
  String output = (double.parse(amount) / exchangeRates[baseCur]! * exchangeRates[finalCur]!).toStringAsFixed(2).toString();
  return output;
}

Future<List<AllCurrencies>> allCurrencies() async {
  Response response = await get(Uri.parse(API.currencyAPI));
  if (response.statusCode == 200) {
    List<dynamic> currencies = jsonDecode(response.body);
    List<AllCurrencies> allCurr = currencies.map((e) => AllCurrencies.fromJson(e)).toList();
    return allCurr;
  } else {
    throw "Unable to retrieve.";
  }
}
Future<List<Convert>> convertCurrencies() async {
  Response response = await get(Uri.parse(API.currencyAPI));
  if (response.statusCode == 200) {
    List<dynamic> convert = jsonDecode(response.body);
    List<Convert> convertCurr = convert.map((e) => Convert.fromJson(e)).toList();
    return convertCurr;
  } else {
    throw "Unable to retrieve.";
  }
}
// Future<List<User>> getPosts() async {
//   Response res = await get(Uri.parse(postsURL));
//
//   if (res.statusCode == 200) {
//     List<dynamic> body = jsonDecode(res.body);
//
//     List<User> posts = body
//         .map(
//           (dynamic item) => User.fromJson(item),
//     )
//         .toList();
//
//     return posts;
//   } else {
//     throw "Unable to retrieve posts.";
//   }
// }
