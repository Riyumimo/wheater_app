import 'dart:convert';

import 'components.dart';
import 'main.dart';

class ListAir {
  int? dt;
  Main? main;
  Components? components;

  ListAir({this.dt, this.main, this.components});

  @override
  String toString() => 'List(dt: $dt, main: $main, components: $components)';

  factory ListAir.fromMap(Map<String, dynamic> data) => ListAir(
        dt: data['dt'] as int?,
        main: data['main'] == null
            ? null
            : Main.fromMap(data['main'] as Map<String, dynamic>),
        components: data['components'] == null
            ? null
            : Components.fromMap(data['components'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        'main': main?.toMap(),
        'components': components?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [List].
  factory ListAir.fromJson(String data) {
    return ListAir.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [List] to a JSON string.
  String toJson() => json.encode(toMap());

  ListAir copyWith({
    int? dt,
    Main? main,
    Components? components,
  }) {
    return ListAir(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      components: components ?? this.components,
    );
  }
}
