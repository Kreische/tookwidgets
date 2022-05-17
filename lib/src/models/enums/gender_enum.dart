enum Gender { male, female, undefined, unselected }

extension GenderExtension on Gender {
  String get genderString {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.undefined:
        return 'Undefined';
      case Gender.unselected:
        return 'Not selected';
      default:
        return 'Not selected';
    }
  }
}
