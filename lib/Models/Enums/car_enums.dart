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

  String get title {
    switch (this) {
      case CarColor.white:
        return 'White';
      case CarColor.brown:
        return 'Brown';
      case CarColor.red:
        return 'Red';
      case CarColor.green:
        return 'Green';
      case CarColor.black:
        return 'Black';
      case CarColor.orange:
        return 'Orange';
      case CarColor.purple:
        return 'Purple';
      case CarColor.pink:
        return 'Pink';
      case CarColor.silver:
        return 'Silver';
      case CarColor.lightBlue:
        return 'Ligh Blue';
      case CarColor.darkBlue:
        return 'Dark Blue';
      case CarColor.darkGrey:
        return 'Dark Grey';
      case CarColor.lightGreen:
        return 'Ligh Green';
      case CarColor.yellow:
        return 'Yellow';
      default:
        return 'White';
    }
  }

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
