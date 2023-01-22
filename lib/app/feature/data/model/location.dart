class Location {
  final String id;
  final String locationLog;
  final String locationLat;
  final String address;

  final String createdAt;
  final String updatedAt;

  Location(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.address,
      required this.locationLat,
      required this.locationLog});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      id: json["_id"],
      locationLat: json["locationLat"]??"",
      locationLog: json["locationLog"]??"",
      address: json["address"]??"",
      createdAt: json["createdAt"]??"",
      updatedAt: json["updatedAt"]??"");
}
