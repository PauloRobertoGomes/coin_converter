import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:coin_converter/app/components/currency_box.dart';
import 'package:coin_converter/app/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toCurrency = TextEditingController();
  final TextEditingController fromCurrency = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(
      fromCurrencyController: fromCurrency,
      toCurrencyController: toCurrency,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 30,
              right: 30,
              bottom: 20,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 50),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: toCurrency,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(height: 10),
                CurrencyBox(
                  items: homeController.currencies,
                  controller: fromCurrency,
                  selectedItem: homeController.fromCurrency,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                SizedBox(height: 50),
                RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text("CONVERTER"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
