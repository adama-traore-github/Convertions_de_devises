# Currency Converter Flutter Application

This Flutter project is a currency converter app that allows users to convert between different currencies with real-time exchange rates.

---

## Features

- **Real-time Conversion**: Supports real-time currency conversion using the `currency_converter_pro` package.
- **Multiple Currencies**: Supports conversion between currencies like XOF, XAF, USD, and EUR.
- **User-Friendly Interface**: Includes dropdown menus for selecting currencies, a text field for entering the amount, and an intuitive layout.
- **Validation**: Ensures the user enters a valid amount before performing the conversion.

---

## Dependencies

This project uses the following dependencies:

- [Flutter](https://flutter.dev/) (SDK)
- [`currency_converter_pro`](https://pub.dev/packages/currency_converter_pro): For fetching exchange rates.

Make sure to add these dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  currency_converter_pro: ^0.0.7
```

---

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/adama-traore-github/Convertions_de_devises/
   ```

2. **Navigate to the project directory**:
   ```bash
   cd currency_converter
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

---

## Project Structure

```
lib/
├── main.dart               # Entry point of the application
├── convert_currency.dart   # Logic for currency conversion
                
```

---

## How It Works

### Conversion Logic

The conversion logic is encapsulated in the `convert_currency.dart` file. It uses the `CurrencyConverterPro` package to fetch real-time exchange rates and calculate the converted amount.

```

### User Interface

The main UI resides in `main.dart`. It includes:

- A text field for the amount input.
- Dropdowns for selecting `from` and `to` currencies.
- A button to trigger the conversion.

---

## How to Contribute

1. **Fork the repository**.
2. **Create a new branch**:
   ```bash
   git checkout -b feature-name
   ```
3. **Make changes** and commit:
   ```bash
   git commit -m "Your commit message"
   ```
4. **Push to your fork**:
   ```bash
   git push origin feature-name
   ```
5. Create a **Pull Request**.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Screenshots

*Add screenshots of your application here to showcase the UI.*
