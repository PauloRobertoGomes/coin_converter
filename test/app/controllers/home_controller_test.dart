import 'package:coin_converter/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toController = TextEditingController();
  final TextEditingController fromController = TextEditingController();

  final homeController = HomeController(
    fromCurrencyController: fromController,
    toCurrencyController: toController,
  );
  test("Deve converter de Real para Dolar", () {
    toController.text = '2.0';
    homeController.convert();
    expect(fromController.text, '0.36');
  });
}
