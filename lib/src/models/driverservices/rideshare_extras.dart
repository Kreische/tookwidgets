part of 'driver_services.dart';

enum RideshareOptsExtras {
  airCondition,
  handsSanitizer,
  babySeat,
  acceptAnimalInCage,
  animalOnLeash,
  airPurifier,
}

extension RideshareOptsExtrasExt on RideshareOptsExtras {
  String get title {
    switch (this) {
      case RideshareOptsExtras.airCondition:
        return 'I provide air condition';
      case RideshareOptsExtras.handsSanitizer:
        return 'I provide hands sanitizer';
      case RideshareOptsExtras.acceptAnimalInCage:
        return 'I accept animal in cage';
      case RideshareOptsExtras.babySeat:
        return 'I have a baby seat';
      case RideshareOptsExtras.animalOnLeash:
        return 'I accept animal on leash';
      case RideshareOptsExtras.airPurifier:
        return 'I have an air purifier';
      default:
        return 'I provide good service';
    }
  }

  String get asset {
    switch (this) {
      case RideshareOptsExtras.airCondition:
        return 'assets/Images/img_snowflake.png';
      case RideshareOptsExtras.handsSanitizer:
        return 'assets/Images/img_hands_sanitizer.png';
      case RideshareOptsExtras.acceptAnimalInCage:
        return 'assets/Images/img_cage.png';
      case RideshareOptsExtras.babySeat:
        return 'assets/Images/img_baby_seat.png';
      case RideshareOptsExtras.animalOnLeash:
        return 'assets/Images/img_leash.png';
      case RideshareOptsExtras.airPurifier:
        return 'assets/Images/img_purifier.png';
      default:
        return 'assets/Images/img_baby_seat.png';
    }
  }
}
