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
      case MusicTypes.noMusic:
        return 'No Music';
      default:
        return 'Classic';
    }
  }

  MusicTypes get next {
    switch (this) {
      case MusicTypes.classic:
        return MusicTypes.pop;
      case MusicTypes.pop:
        return MusicTypes.rock;
      case MusicTypes.rock:
        return MusicTypes.classic;
      case MusicTypes.noMusic:
        return MusicTypes.classic;
      default:
        return MusicTypes.classic;
    }
  }
}
