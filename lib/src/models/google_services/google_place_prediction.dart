import 'dart:convert';

class PlacePrediction {
  PlacePrediction({
    this.description,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.types,
  });

  factory PlacePrediction.fromMap(map) {
    return PlacePrediction(
      description: map['description'] as String?,
      placeId: map['place_id'] as String?,
      reference: map['reference'] as String?,
      structuredFormatting:
          StructuredFormatting.fromMap(map['structured_formatting']),
      types: List<String>.from(map['types'] as Iterable),
    );
  }

  factory PlacePrediction.fromJson(String source) =>
      PlacePrediction.fromMap(json.decode(source));

  final String? description;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;
  final List<String>? types;
}

class StructuredFormatting {
  StructuredFormatting({
    this.mainText,
    this.secondaryText,
  });

  factory StructuredFormatting.fromMap(map) {
    return StructuredFormatting(
      mainText: map['main_text'] as String?,
      secondaryText: map['secondary_text'] as String?,
    );
  }

  factory StructuredFormatting.fromJson(String source) =>
      StructuredFormatting.fromMap(json.decode(source));

  final String? mainText;
  final String? secondaryText;
}
