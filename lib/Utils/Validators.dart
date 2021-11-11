mixin ValidatorUtils {
  static String? validateMobile(String? value) {
    const String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(patttern);
    if ((value ?? '').isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value ?? '')) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static bool profileImageValidator(String value) {
    const letterImage = 'https://lh3.googleusercontent.com/a/';
    if (value.contains(letterImage)) return false;
    return true;
  }
}
