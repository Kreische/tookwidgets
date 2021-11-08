import 'package:tookwidgets/Models/currency.dart';

mixin SuppotedCurrencies {
  static final list = [
    CurrencyData(
      country: 'Pakistan',
      countryCode: 'pk',
      currency: 'Pakistani Rupees',
      currencyCode: 'Rs',
    ),
    CurrencyData(
      country: 'Brazil',
      countryCode: 'br',
      currency: 'Brazilian real',
      currencyCode: r'R$',
    ),
    CurrencyData(
      country: 'Australia',
      countryCode: 'au',
      currency: 'Australian dollar',
      currencyCode: r'$',
    ),
    CurrencyData(
      country: 'Japan',
      countryCode: 'jp',
      currency: 'Japanese yen',
      currencyCode: '¥',
    ),
    CurrencyData(
      country: 'Nigeria',
      countryCode: 'au',
      currency: 'Nigerian naira',
      currencyCode: '₦',
    ),
    CurrencyData(
      country: 'India',
      countryCode: 'in',
      currency: 'Indian Rupees',
      currencyCode: '₹',
    ),
  ];
}
