import 'dart:convert';

FacultyModel facultyFromJson(String str) => FacultyModel.fromJson(json.decode(str));

String facultyToJson(FacultyModel data) => json.encode(data.toJson());

class FacultyModel {
  FacultyModel({
    required this.id,
    required this.facultyName,
    required this.universityDetailId,
  });

  String id;
  String facultyName;
  String universityDetailId;

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
    id: json["id"],
    facultyName: json["faculty_name"],
    universityDetailId: json["university_detail_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "faculty_name": facultyName,
    "university_detail_id": universityDetailId,
  };
}
