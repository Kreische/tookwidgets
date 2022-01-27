String enumToString(Object? o) => o.toString().split('.').last;

T? enumFromString<T>(String? key, List<T> values) {
  if (key == null) return null;
  if (values.every((e) => e.toString().split('.').last != key)) return null;
  return values.firstWhere((v) => key.split('.').last == enumToString(v));
}
