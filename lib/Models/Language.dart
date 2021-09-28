import 'dart:convert';

class Language {
  Language({
    required this.title,
    required this.key,
  });

  factory Language.fromMap(map) {
    return Language(
      title: map['title'] as String?,
      key: map['key'] as String?,
    );
  }

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source));

  final String? title;
  final String? key;

  Language copyWith({
    String? title,
    String? key,
  }) {
    return Language(
      title: title ?? this.title,
      key: key ?? this.key,
    );
  }
}
