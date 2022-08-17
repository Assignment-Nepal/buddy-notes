// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SemYearModel semYearModelFromJson(String str) => SemYearModel.fromJson(json.decode(str));

String semYearModelToJson(SemYearModel data) => json.encode(data.toJson());

class SemYearModel {
  SemYearModel({
    this.id,
    this.facultyDetailId,
    this.semName,
    this.universityDetailId,
  });

  String? id;
  String? facultyDetailId;
  String? semName;
  String? universityDetailId;

  factory SemYearModel.fromJson(Map<String, dynamic> json) => SemYearModel(
    id: json["id"],
    facultyDetailId: json["faculty_detail_id"],
    semName: json["sem_name"],
    universityDetailId: json["university_detail_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "faculty_detail_id": facultyDetailId,
    "sem_name": semName,
    "university_detail_id": universityDetailId,
  };
}
