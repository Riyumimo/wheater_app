import 'dart:convert';

import 'list.dart';

class AirPollutton {
  List<int>? coord;
  List<ListAir>? list;

  AirPollutton({this.coord, this.list});

  @override
  String toString() => 'AirPollutton(coord: $coord, list: $list)';

  factory AirPollutton.fromMap(Map<String, dynamic> data) => AirPollutton(
      coord: data['coord'] as List<int>?,
      list: (data['list'] as List<dynamic>?)
          ?.map((e) => ListAir.fromMap(e as Map<String, dynamic>))
          .toList());

  Map<String, dynamic> toMap() => {
        'coord': coord,
        'list': list
            ?.map(
              (e) => e,
            )
            .toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AirPollutton].
  factory AirPollutton.fromJson(String data) {
    return AirPollutton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AirPollutton] to a JSON string.
  String toJson() => json.encode(toMap());

  AirPollutton copyWith({
    List<int>? coord,
    List<ListAir>? list,
  }) {
    return AirPollutton(
      coord: coord ?? this.coord,
      list: list ?? this.list,
    );
  }
}
