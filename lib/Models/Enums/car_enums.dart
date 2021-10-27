part of '../Car.dart';

enum CarColor {
  white,
  red,
  green,
  yellow,
  black,
  orange,
  brown,
  purple,
  pink,
  silver,
  lightBlue,
  darkBlue,
  darkGrey,
  lightGreen,
}

enum CarCategory { private, taxi }

extension CarCategoryExtension on CarCategory {
  String get toMap => toString().split('.').last;

  String? get getString {
    switch (this) {
      case CarCategory.private:
        return PluginStringData.private;
      case CarCategory.taxi:
        return PluginStringData.taxi;
      default:
        return PluginStringData.private;
    }
  }
}

extension CarColorExtension on CarColor {
  String get toMap => toString().split('.').last;

  Tuple<String, String> get param {
    switch (this) {
      case CarColor.white:
        return Tuple(
          CarAssetString.white,
          'White',
        );
      case CarColor.brown:
        return Tuple(
          CarAssetString.brown,
          'Brown',
        );
      case CarColor.red:
        return Tuple(
          CarAssetString.red,
          'Red',
        );
      case CarColor.green:
        return Tuple(
          CarAssetString.green,
          'Green',
        );
      case CarColor.black:
        return Tuple(
          CarAssetString.black,
          'Black',
        );
      case CarColor.orange:
        return Tuple(
          CarAssetString.orange,
          'Orange',
        );
      case CarColor.purple:
        return Tuple(
          CarAssetString.purple,
          'Purple',
        );
      case CarColor.pink:
        return Tuple(
          CarAssetString.pink,
          'Pink',
        );
      case CarColor.silver:
        return Tuple(
          CarAssetString.silver,
          'Silver',
        );
      case CarColor.lightBlue:
        return Tuple(
          CarAssetString.lightBlue,
          'Ligh Blue',
        );
      case CarColor.darkBlue:
        return Tuple(
          CarAssetString.darkBlue,
          'Dark Blue',
        );
      case CarColor.darkGrey:
        return Tuple(
          CarAssetString.darkGrey,
          'Dark Grey',
        );
      case CarColor.lightGreen:
        return Tuple(
          CarAssetString.lightGreen,
          'Ligh Green',
        );
      case CarColor.yellow:
        return Tuple(
          CarAssetString.yellow,
          'Yellow',
        );
      default:
        return Tuple(CarAssetString.white, 'White');
    }
  }

  String get title => toString().split('.').last.capitalize;

  String get image {
    switch (this) {
      case CarColor.white:
        return CarAssetString.white;
      case CarColor.brown:
        return CarAssetString.brown;
      case CarColor.red:
        return CarAssetString.red;
      case CarColor.green:
        return CarAssetString.green;
      case CarColor.black:
        return CarAssetString.black;
      case CarColor.orange:
        return CarAssetString.orange;
      case CarColor.purple:
        return CarAssetString.purple;
      case CarColor.pink:
        return CarAssetString.pink;
      case CarColor.silver:
        return CarAssetString.silver;
      case CarColor.lightBlue:
        return CarAssetString.lightBlue;
      case CarColor.darkBlue:
        return CarAssetString.darkBlue;
      case CarColor.darkGrey:
        return CarAssetString.darkGrey;
      case CarColor.lightGreen:
        return CarAssetString.lightGreen;
      case CarColor.yellow:
        return CarAssetString.yellow;
      default:
        return CarAssetString.white;
    }
  }
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
