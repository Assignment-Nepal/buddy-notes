import 'dart:convert';

SubjectModel subjectModelFromJson(String str) => SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
  SubjectModel({
    this.id,
    this.facultyDetailId,
    this.subName,
    this.semDetailId,
    this.universityDetailId,
  });

  String? id;
  String? facultyDetailId;
  String? subName;
  String? semDetailId;
  String? universityDetailId;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json["id"],
    facultyDetailId: json["faculty_detail_id"],
    subName: json["sub_name"],
    semDetailId: json["sem_detail_id"],
    universityDetailId: json["university_detail_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "faculty_detail_id": facultyDetailId,
    "sub_name": subName,
    "sem_detail_id": semDetailId,
    "university_detail_id": universityDetailId,
  };
}