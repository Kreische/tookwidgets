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
      country: 'Brazilia',
      countryCode: 'br',
      currency: 'BR',
      currencyCode: 'BR',
    ),
    CurrencyData(
      country: 'Australia',
      countryCode: 'au',
      currency: 'AUD',
      currencyCode: r'$',
    ),
  ];
}
