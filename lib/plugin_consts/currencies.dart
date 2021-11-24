import 'package:tookwidgets/models/currency.dart';

mixin SuppotedCurrencies {
  static final list = [
    CurrencyData(
      country: 'Australia',
      countryCode: 'au',
      currency: 'Australian Dollar',
      currencyCode: r'$',
    ),
    CurrencyData(
      country: 'Brazil',
      countryCode: 'br',
      currency: 'Brazilian Real',
      currencyCode: r'R$',
    ),
    CurrencyData(
      country: 'India',
      countryCode: 'in',
      currency: 'Indian Rupees',
      currencyCode: '₹',
    ),
    CurrencyData(
      country: 'Japan',
      countryCode: 'jp',
      currency: 'Japanese Yen',
      currencyCode: '¥',
    ),
    CurrencyData(
      country: 'New Zealand',
      countryCode: 'nz',
      currency: 'New Zealand Dollar',
      currencyCode: r'$',
    ),
    CurrencyData(
      country: 'Nigeria',
      countryCode: 'ng',
      currency: 'Nigerian Naira',
      currencyCode: '₦',
    ),
    CurrencyData(
      country: 'Pakistan',
      countryCode: 'pk',
      currency: 'Pakistani Rupees',
      currencyCode: 'Rs',
    ),
  ];
}