class LocationFields {
  static String id = "id";
  static String lat = "lat";
  static String long = "long";
  static String createdAt = "createdAt";
}

class LocationModel {
  final int? id;
  final String lat;
  final String long;
  final String createdAt;

  LocationModel({
    this.id,
    required this.lat,
    required this.long,
    required this.createdAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json["id"] as int? ?? -1,
      lat: json["lat"] as String? ?? "",
      long: json['long'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
    );
  }

  LocationModel copyWith({
    int? id,
    String? lat,
    String? long,
    String? createdAt,
  }) {
    return LocationModel(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "lat": lat,
      "long": long,
      "createdAt": createdAt,
    };
  }
}
