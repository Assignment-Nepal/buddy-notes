import 'dart:convert';

NotesModel notesModelFromJson(String str) => NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  NotesModel({
    this.id,
    this.facultyDetailId,
    this.notesName,
    this.notesUrl,
    this.semDetailId,
    this.subjectDetailId,
    this.universityDetailId,
  });

  String? id;
  String? facultyDetailId;
  String? notesName;
  String? notesUrl;
  String? semDetailId;
  String? subjectDetailId;
  String? universityDetailId;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
    id: json["id"],
    facultyDetailId: json["faculty_detail_id"],
    notesName: json["notes_name"],
    notesUrl: json["notes_url"],
    semDetailId: json["sem_detail_id"],
    subjectDetailId: json["subject_detail_id"],
    universityDetailId: json["university_detail_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "faculty_detail_id": facultyDetailId,
    "notes_name": notesName,
    "notes_url": notesUrl,
    "sem_detail_id": semDetailId,
    "subject_detail_id": subjectDetailId,
    "university_detail_id": universityDetailId,
  };
}
