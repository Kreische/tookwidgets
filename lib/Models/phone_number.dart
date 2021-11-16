class PhoneNumber {
  const PhoneNumber({
    required this.countryIsoCode,
    required this.countryCode,
    required this.number,
  });

  final String countryIsoCode;
  final String countryCode;
  final String number;

  String get _checkNumberZero {
    if (number.startsWith('0')) return number.replaceFirst('0', '');
    return number;
  }

  String get fullNumber => '+' + countryIsoCode + _checkNumberZero;
}

class CountriesPhoneData {
  const CountriesPhoneData({
    required this.countryName,
    required this.flag,
    required this.code,
    required this.dialCode,
    required this.maxLength,
  });

  factory CountriesPhoneData.fromMap(map) {
    return CountriesPhoneData(
      countryName: map['countryName'] as String,
      flag: map['flag'] as String,
      code: map['code'] as String,
      dialCode: map['dialCode'] as int,
      maxLength: map['maxLength'] as int,
    );
  }

  final String countryName;
  final String flag;
  final String code;
  final int dialCode;
  final int maxLength;

  Map<String, dynamic> get toMap => {
        'countryName': countryName,
        'flag': flag,
        'code': code,
        'dialCode': dialCode,
        'maxLength': maxLength,
      };

  String get fullDialCode => '+$dialCode';
}
