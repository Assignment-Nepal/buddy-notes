import 'dart:convert';

UniversityModel universityFromJson(String str) => UniversityModel.fromJson(json.decode(str));

String universityToJson(UniversityModel data) => json.encode(data.toJson());

class UniversityModel {
  UniversityModel({
    required this.universityName,
    required this.location,
    this.universityLogoUrl,
    required this.id,
  });

  String universityName;
  String location;
  String id;
  String? universityLogoUrl;

  factory UniversityModel.fromJson(Map<String, dynamic> json) => UniversityModel(
    universityName: json["university_name"],
    location: json["location"],
    id: json["id"],
    universityLogoUrl: json["university_logo_url"],
  );

  Map<String, dynamic> toJson() => {
    "university_name": universityName,
    "location": location,
    "university_logo_url": universityLogoUrl,
    "id": id,
  };
}
