import 'dart:convert';

class Components {
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  double? nh3;

  Components({
    this.co,
    this.no,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.nh3,
  });

  @override
  String toString() {
    return 'Components(co: $co, no: $no, no2: $no2, o3: $o3, so2: $so2, pm25: $pm25, pm10: $pm10, nh3: $nh3)';
  }

  factory Components.fromMap(Map<String, dynamic> data) => Components(
        co: (data['co'] as num?)?.toDouble(),
        no: (data['no'] as num?)?.toDouble(),
        no2: (data['no2'] as num?)?.toDouble(),
        o3: (data['o3'] as num?)?.toDouble(),
        so2: (data['so2'] as num?)?.toDouble(),
        pm25: (data['pm2_5'] as num?)?.toDouble(),
        pm10: (data['pm10'] as num?)?.toDouble(),
        nh3: (data['nh3'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'co': co,
        'no': no,
        'no2': no2,
        'o3': o3,
        'so2': so2,
        'pm2_5': pm25,
        'pm10': pm10,
        'nh3': nh3,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Components].
  factory Components.fromJson(String data) {
    return Components.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Components] to a JSON string.
  String toJson() => json.encode(toMap());

  Components copyWith({
    double? co,
    double? no,
    double? no2,
    double? o3,
    double? so2,
    double? pm25,
    double? pm10,
    double? nh3,
  }) {
    return Components(
      co: co ?? this.co,
      no: no ?? this.no,
      no2: no2 ?? this.no2,
      o3: o3 ?? this.o3,
      so2: so2 ?? this.so2,
      pm25: pm25 ?? this.pm25,
      pm10: pm10 ?? this.pm10,
      nh3: nh3 ?? this.nh3,
    );
  }
}
