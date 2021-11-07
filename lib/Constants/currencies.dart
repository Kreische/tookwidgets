import 'package:tookwidgets/Models/currency.dart';

mixin SuppotedCurrencies {
  static final list = [
    CurrencyData(
      country: 'Pakistan',
      countryCode: 'pk',
      currency: 'PKR',
      currencyCode: 'Rs',
    ),
    CurrencyData(
      country: 'Brazil',
      countryCode: 'br',
      currency: 'BR',
      currencyCode: r'R$',
    ),
    CurrencyData(
      country: 'Australia',
      countryCode: 'au',
      currency: 'AUD',
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
      currency: 'JPY',
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
