import 'package:currency_converter_pro/currency_converter_pro.dart';

class CurrencyConverterService {
  Future<double> convertCurrency({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    try {
      final currencyConverterPro = CurrencyConverterPro();
      final result = await currencyConverterPro.convertCurrency(
        amount: amount,
        fromCurrency: fromCurrency.toLowerCase(),
        toCurrency: toCurrency.toLowerCase(),
      );
      return result;
    } catch (e) {
      throw Exception('Conversion failed: $e');
    }
  }
}
