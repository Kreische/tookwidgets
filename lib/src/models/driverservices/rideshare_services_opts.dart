part of 'driver_services.dart';

@immutable
class RideshareServiceOpts {
  const RideshareServiceOpts({
    this.acceptImidiateRide = true,
    this.autoConfirmImidiateRide = false,
    this.acceptSheduleRide = true,
    this.autoConfirmSheduleRide = false,
    this.bidForSheduleRideWhileOffline = false,
    this.setMyPricesAsVariables = false,
    this.chargeCustomerAtTheEnd = false,
    this.acceptMaleCustomers = true,
    this.acceptFemaleCustomers = true,
    this.wifiConfig = const WifiConfig(),
    this.extras = const [],
  });

  factory RideshareServiceOpts.fromMap(map) {
    if (map == null) return const RideshareServiceOpts();
    return RideshareServiceOpts(
      acceptImidiateRide: (map['acceptImidiateRide'] ?? false) as bool,
      autoConfirmImidiateRide:
          (map['autoConfirmImidiateRide'] ?? false) as bool,
      acceptSheduleRide: (map['acceptSheduleRide'] ?? false) as bool,
      autoConfirmSheduleRide: (map['autoConfirmSheduleRide'] ?? false) as bool,
      bidForSheduleRideWhileOffline:
          (map['bidForSheduleRideWhileOffline'] ?? false) as bool,
      setMyPricesAsVariables: (map['setMyPricesAsVariables'] ?? false) as bool,
      chargeCustomerAtTheEnd: (map['chargeCustomerAtTheEnd'] ?? false) as bool,
      acceptMaleCustomers: (map['acceptMaleCustomers'] ?? false) as bool,
      acceptFemaleCustomers: (map['acceptFemaleCustomers'] ?? false) as bool,
      wifiConfig: WifiConfig.fromMap(map['wifiConfig']),
      extras: List<RideshareOptsExtras>.from((map['extras'] ?? []).map(
        (e) => enumFromString<RideshareOptsExtras>(
            e as String, RideshareOptsExtras.values),
      ) as Iterable),
    );
  }

  factory RideshareServiceOpts.fromJson(String source) =>
      RideshareServiceOpts.fromMap(json.decode(source));

  final bool acceptImidiateRide;
  final bool autoConfirmImidiateRide;
  final bool acceptSheduleRide;
  final bool autoConfirmSheduleRide;
  final bool bidForSheduleRideWhileOffline;
  final bool setMyPricesAsVariables;
  final bool chargeCustomerAtTheEnd;
  final bool acceptMaleCustomers;
  final bool acceptFemaleCustomers;
  final WifiConfig wifiConfig;
  final List<RideshareOptsExtras> extras;

  RideshareServiceOpts copyWith({
    bool? acceptImidiateRide,
    bool? autoConfirmImidiateRide,
    bool? acceptSheduleRide,
    bool? autoConfirmSheduleRide,
    bool? bidForSheduleRideWhileOffline,
    bool? setMyPricesAsVariables,
    bool? chargeCustomerAtTheEnd,
    WifiConfig? wifiConfig,
    List<RideshareOptsExtras>? extras,
  }) {
    return RideshareServiceOpts(
      acceptImidiateRide: acceptImidiateRide ?? this.acceptImidiateRide,
      autoConfirmImidiateRide:
          autoConfirmImidiateRide ?? this.autoConfirmImidiateRide,
      acceptSheduleRide: acceptSheduleRide ?? this.acceptSheduleRide,
      autoConfirmSheduleRide:
          autoConfirmSheduleRide ?? this.autoConfirmSheduleRide,
      bidForSheduleRideWhileOffline:
          bidForSheduleRideWhileOffline ?? this.bidForSheduleRideWhileOffline,
      setMyPricesAsVariables:
          setMyPricesAsVariables ?? this.setMyPricesAsVariables,
      chargeCustomerAtTheEnd:
          chargeCustomerAtTheEnd ?? this.chargeCustomerAtTheEnd,
      wifiConfig: wifiConfig ?? this.wifiConfig,
      extras: extras ?? this.extras,
    );
  }

  Map<String, dynamic> get toMap => {
        'acceptImidiateRide': acceptImidiateRide,
        'autoConfirmImidiateRide': autoConfirmImidiateRide,
        'acceptSheduleRide': acceptSheduleRide,
        'autoConfirmSheduleRide': autoConfirmSheduleRide,
        'bidForSheduleRideWhileOffline': bidForSheduleRideWhileOffline,
        'setMyPricesAsVariables': setMyPricesAsVariables,
        'chargeCustomerAtTheEnd': chargeCustomerAtTheEnd,
        'acceptFemaleCustomers': acceptFemaleCustomers,
        'acceptMaleCustomers': acceptMaleCustomers,
        'wifiConfig': wifiConfig.toMap,
        'extras': extras.map((e) => enumToString(e)).toList(),
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RideshareServiceOpts &&
        other.acceptImidiateRide == acceptImidiateRide &&
        other.autoConfirmImidiateRide == autoConfirmImidiateRide &&
        other.acceptSheduleRide == acceptSheduleRide &&
        other.autoConfirmSheduleRide == autoConfirmSheduleRide &&
        other.bidForSheduleRideWhileOffline == bidForSheduleRideWhileOffline &&
        other.setMyPricesAsVariables == setMyPricesAsVariables &&
        other.chargeCustomerAtTheEnd == chargeCustomerAtTheEnd &&
        other.wifiConfig == wifiConfig &&
        other.acceptFemaleCustomers == acceptFemaleCustomers &&
        other.acceptMaleCustomers == acceptMaleCustomers &&
        listEquals(other.extras, extras);
  }

  @override
  int get hashCode {
    return hashList([
      acceptImidiateRide,
      autoConfirmImidiateRide,
      acceptSheduleRide,
      autoConfirmSheduleRide,
      bidForSheduleRideWhileOffline,
      setMyPricesAsVariables,
      chargeCustomerAtTheEnd,
      acceptFemaleCustomers,
      acceptMaleCustomers,
      wifiConfig,
      extras,
    ]);
  }
}
