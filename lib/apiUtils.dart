import 'package:flutter/material.dart';

class API {
  static String currencyAPI = 'https://api.apilayer.com/currency_data/list?apikey=WxDgTCPs29iUgbKqDNVJRaJF0XjYrTp2';
  static String currencyConvertAPI = 'https://api.apilayer.com/currency_data/convert?to=USD&from=INR&amount=50&apikey=WxDgTCPs29iUgbKqDNVJRaJF0XjYrTp2';
}

class ApiString {
  static TextEditingController amountController = TextEditingController();
  static String dropdownValue1 = 'AUD';
  static String dropdownValue2 = 'AUD';
  static String answer = 'Converted Currency will be shown here :)';
}
