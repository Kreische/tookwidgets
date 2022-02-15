String enumToString(Object? o) => o.toString().split('.').last;

T? enumFromString<T>(String? key, List<T> values) {
  if (key == null) return null;
  if (values.every((e) => enumToString(e) != enumToString(key))) return null;
  return values.firstWhere((v) => enumToString(key) == enumToString(v));
}
