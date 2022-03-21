part of 'driver_services.dart';

@immutable
class WifiConfig {
  const WifiConfig({
    this.available = false,
    this.name = '',
    this.password = '',
  });

  factory WifiConfig.fromMap(map) {
    if (map == null) return const WifiConfig();
    return WifiConfig(
      available: (map['available'] ?? false) as bool,
      name: (map['name'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  factory WifiConfig.fromJson(String source) =>
      WifiConfig.fromMap(json.decode(source));

  final bool available;
  final String name;
  final String password;

  WifiConfig copyWith({
    bool? available,
    String? name,
    String? password,
  }) {
    return WifiConfig(
      available: available ?? this.available,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> get toMap => {
        'available': available,
        'name': name,
        'password': password,
      };

  String toJson() => json.encode(toMap);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WifiConfig &&
        other.available == available &&
        other.name == name &&
        other.password == password;
  }

  @override
  int get hashCode {
    return hashList([
      available,
      name,
      password,
    ]);
  }
}
