enum AcceptedCurrencies { aud, pkr, brl, inr, jpy, nzd, ngn }

extension AcceptedCurrenciesExt on AcceptedCurrencies {
  String get symbol {
    switch (this) {
      case AcceptedCurrencies.aud:
        return r'$';
      case AcceptedCurrencies.pkr:
        return 'Rs';
      case AcceptedCurrencies.brl:
        return r'R$';
      case AcceptedCurrencies.inr:
        return '₹';
      case AcceptedCurrencies.jpy:
        return '¥';
      case AcceptedCurrencies.nzd:
        return r'$';
      case AcceptedCurrencies.ngn:
        return '₦';
      default:
        return r'$';
    }
  }

  String symbolWriting(data) {
    switch (this) {
      case AcceptedCurrencies.aud:
        return '\$$data';
      case AcceptedCurrencies.pkr:
        return 'Rs:$data';
      case AcceptedCurrencies.brl:
        return 'R\$$data';
      case AcceptedCurrencies.inr:
        return '$data₹';
      case AcceptedCurrencies.jpy:
        return '$data\¥';
      case AcceptedCurrencies.nzd:
        return '$data\$';
      case AcceptedCurrencies.ngn:
        return '$data₦';
      default:
        return '\$$data';
    }
  }

  String fullNumberWriting(data) {
    final fw = toString().toUpperCase();
    return '$data $fw';
  }
}
