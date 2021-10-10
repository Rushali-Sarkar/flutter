import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const kWidgetTextStyle = TextStyle(
  fontSize: 20.0,
);
List<Widget> allWidgets = [];
void createTextWidgets() {
  for (String currency in currenciesList) {
    allWidgets.add(
      Text(currency,
      style: kWidgetTextStyle)
    );
  }
}

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'FDC693A5-15F3-4B50-BA31-1459E740330B';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    List<double> currencyValues = [];
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      var client = http.Client();
      var url = Uri.parse(requestURL);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        currencyValues.add(price);
        print(price);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return currencyValues;
  }
}