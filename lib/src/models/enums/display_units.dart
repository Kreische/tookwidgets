enum DistanceMeasureUnit { kilometer, mile }

extension DistanceMeasureUnitExt on DistanceMeasureUnit {
  String get title {
    switch (this) {
      case DistanceMeasureUnit.kilometer:
        return 'Kilo-meters';
      case DistanceMeasureUnit.mile:
        return 'Miles';
      default:
        return 'Kilo-meters';
    }
  }
}
