import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../address.dart';

@immutable
class GeocodeAddress {
  const GeocodeAddress({
    this.latlng,
    this.placeId,
    this.addressLine,
    this.countryName,
    this.countryCode,
    this.featureName,
    this.postalCode,
    this.adminArea,
    this.adminAreaCode,
    this.subAdminArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare,
  });

  /// Creates an address from a map containing its properties.
  GeocodeAddress.fromMap(Map map)
      : latlng = LatLng(
          map['coordinates']['latitude'] as double,
          map['coordinates']['longitude'] as double,
        ),
        placeId = map['placeId'] as String?,
        addressLine = map['addressLine'] as String?,
        countryName = map['countryName'] as String?,
        countryCode = map['countryCode'] as String?,
        featureName = map['featureName'] as String?,
        postalCode = map['postalCode'] as String?,
        locality = map['locality'] as String?,
        subLocality = map['subLocality'] as String?,
        adminArea = map['adminArea'] as String?,
        adminAreaCode = map['adminAreaCode'] as String?,
        subAdminArea = map['subAdminArea'] as String?,
        thoroughfare = map['thoroughfare'] as String?,
        subThoroughfare = map['subThoroughfare'] as String?;

  /// The geographic coordinates.
  final LatLng? latlng;

  /// The Place Id of the point
  final String? placeId;

  /// The formatted address with all lines.
  final String? addressLine;

  /// The localized country name of the address.
  final String? countryName;

  /// The country code of the address.
  final String? countryCode;

  /// The feature name of the address.
  final String? featureName;

  /// The postal code.
  final String? postalCode;

  /// The administrative area name of the address
  final String? adminArea;

  /// The administrative area code of the address
  final String? adminAreaCode;

  /// The sub-administrative area name of the address
  final String? subAdminArea;

  /// The locality of the address
  final String? locality;

  /// The sub-locality of the address
  final String? subLocality;

  /// The thoroughfare name of the address
  final String? thoroughfare;

  /// The sub-thoroughfare name of the address
  final String? subThoroughfare;

  /// Creates a map from the address properties.
  Map get toMap => {
        'latlng': latlng?.toJson(),
        'addressLine': addressLine,
        'countryName': countryName,
        'countryCode': countryCode,
        'featureName': featureName,
        'postalCode': postalCode,
        'locality': locality,
        'subLocality': subLocality,
        'adminArea': adminArea,
        'adminAreaCode': adminAreaCode,
        'subAdminArea': subAdminArea,
        'thoroughfare': thoroughfare,
        'subThoroughfare': subThoroughfare,
      };

  Address get address {
    return Address(
      placeId: placeId,
      formatedAddress: addressLine!,
      latLng: latlng!,
      stateAndCountry: countryName,
      countryCode: countryCode,
    );
  }
}
