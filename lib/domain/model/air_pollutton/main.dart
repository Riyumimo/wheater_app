import 'dart:convert';

class Main {
  int? aqi;

  Main({this.aqi});

  @override
  String toString() => 'Main(aqi: $aqi)';

  factory Main.fromMap(Map<String, dynamic> data) => Main(
        aqi: data['aqi'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'aqi': aqi,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Main].
  factory Main.fromJson(String data) {
    return Main.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Main] to a JSON string.
  String toJson() => json.encode(toMap());

  Main copyWith({
    int? aqi,
  }) {
    return Main(
      aqi: aqi ?? this.aqi,
    );
  }
}
