class ComplainType {
  final String id;
  final String complainType;
  final String discription;
  final String createdAt;
  final String updatedAt;

  ComplainType(
      {required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.discription,
        required this.complainType});

  factory ComplainType.fromJson(Map<String, dynamic> json) => ComplainType(
      id: json["_id"],
      discription: json["discription"],
      complainType: json["complainType"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]);
}
