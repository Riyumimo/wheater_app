class Rain {
  double? h;

  Rain({this.h});

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        h: (json['3h'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '3h': h,
      };
}
