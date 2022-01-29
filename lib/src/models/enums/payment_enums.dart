import 'package:tookwidgets/src/plugin_consts/plugin_asset_strings.dart';
import 'package:tookwidgets/took_widgets.dart';

enum PaymentMethod { inApp, cash, cardMachine, bankTransfer }

extension PaymentExt on PaymentMethod {
  String get toMap => enumToString(this);

  Tuple<String, String> get config {
    switch (this) {
      case PaymentMethod.inApp:
        return Tuple('assets/Icons/in_app_pay.png', 'In App');
      case PaymentMethod.cash:
        return Tuple(PluginAssetString.cashPayment, 'Cash');
      case PaymentMethod.bankTransfer:
        return Tuple(PluginAssetString.bank, 'Bank');
      case PaymentMethod.cardMachine:
        return Tuple(PluginAssetString.cardMachine, 'Card');
      default:
        return Tuple(PluginAssetString.cashPayment, 'Cash');
    }
  }

  String get askAboutAcceptance {
    switch (this) {
      case PaymentMethod.inApp:
        return 'Do you accept in app payment';
      case PaymentMethod.cash:
        return PluginStringData.acceptCashpayments;
      case PaymentMethod.bankTransfer:
        return PluginStringData.acceptBankTransferPayments;
      case PaymentMethod.cardMachine:
        return PluginStringData.acceptCardPayments;
      default:
        return 'Accept this payment';
    }
  }

  String get asset {
    switch (this) {
      case PaymentMethod.inApp:
        return 'assets/Icons/in_app_pay.png';
      case PaymentMethod.cash:
        return PluginAssetString.cashPayment;
      case PaymentMethod.bankTransfer:
        return PluginAssetString.bank;
      case PaymentMethod.cardMachine:
        return PluginAssetString.cardMachine;
      default:
        return PluginAssetString.cashPayment;
    }
  }

  String get amountToShow {
    switch (this) {
      case PaymentMethod.inApp:
        return PluginStringData.inAppPayAmount;
      case PaymentMethod.cash:
        return PluginStringData.cashAmount;
      case PaymentMethod.bankTransfer:
        return PluginStringData.bankAmount;
      case PaymentMethod.cardMachine:
        return PluginStringData.cardAmount;
      default:
        return PluginStringData.cashAmount;
    }
  }
}
