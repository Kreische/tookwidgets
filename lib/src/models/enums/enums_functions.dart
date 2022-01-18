String enumToString(Object? o) => o.toString().split('.').last;

T? enumFromString<T>(String? key, List<T> values) {
  if (key == null) return null;
  return values.firstWhere((v) => key.split('.').last == enumToString(v));
}
