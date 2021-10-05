import 'package:coin_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final TextEditingController toCurrencyController;
  final TextEditingController fromCurrencyController;

  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toCurrencyController, this.fromCurrencyController}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toCurrencyController.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0;

    if (fromCurrency.name == "Real") {
      convertedValue = value * toCurrency.real;
    } else if (fromCurrency.name == "Dolar") {
      convertedValue = value * toCurrency.dolar;
    } else if (fromCurrency.name == "Euro") {
      convertedValue = value * toCurrency.euro;
    } else if (fromCurrency.name == "Bitcoin") {
      convertedValue = value * toCurrency.bitcoin;
    }

    fromCurrencyController.text = convertedValue.toStringAsFixed(2);
  }
}
