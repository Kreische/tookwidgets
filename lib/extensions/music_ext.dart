part of '../models/enums/music.dart';

extension MusicTypesExt on MusicTypes {
  String get typeName {
    switch (this) {
      case MusicTypes.classic:
        return 'Classic';
      case MusicTypes.pop:
        return 'Pop';
      case MusicTypes.rock:
        return 'Rock';
      default:
        return 'Classic';
    }
  }
}
