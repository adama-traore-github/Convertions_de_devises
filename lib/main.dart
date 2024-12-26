import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CurrencyConverterPage(),
      debugShowCheckedModeBanner: false, // Supprime le badge DEBUG.
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  CurrencyConverterPageState createState() => CurrencyConverterPageState();
}

class CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  String _convertedAmount = '';
  String _fromCurrency = 'XOF'; // Devise source par défaut.
  String _toCurrency = 'EUR'; // Devise cible par défaut.
  final String apiKey = '0a2b9a31d496fe2ea770268d'; // Ta clé API.

  Future<void> _convertCurrency() async {
    try {
      final amount = double.tryParse(_amountController.text);
      if (amount == null || amount <= 0) {
        setState(() {
          _convertedAmount = 'Please enter a valid amount.';
        });
        return;
      }

      final response = await http.get(Uri.parse(
          'https://v6.exchangerate-api.com/v6/$apiKey/latest/$_fromCurrency'));

      if (response.statusCode == 200) {
        final rates = json.decode(response.body)['conversion_rates'];
        final rate = rates[_toCurrency];
        if (rate != null) {
          setState(() {
            _convertedAmount =
                '${(amount * rate).toStringAsFixed(2)} $_toCurrency';
          });
        } else {
          setState(() {
            _convertedAmount = 'Conversion rate not found.';
          });
        }
      } else {
        setState(() {
          _convertedAmount = 'Failed to fetch rates.';
        });
      }
    } catch (e) {
      setState(() {
        _convertedAmount = 'Error: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Amount:'),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Amount'),
            ),
            const SizedBox(height: 16),
            const Text('From Currency:'),
            DropdownButton<String>(
              value: _fromCurrency,
              items: ['XOF', 'XAF', 'USD', 'EUR'] 
                  .map((currency) => DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromCurrency = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('To Currency:'),
            DropdownButton<String>(
              value: _toCurrency,
              items: ['XOF', 'XAF', 'USD', 'EUR'] // Ajoute 'XOF' ici.
                  .map((currency) => DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _toCurrency = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 24),
            Text(
              _convertedAmount,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}