

import 'package:buddyapp/firebase_utils/firebase_abstract.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/notes_model.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/sem_models.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/model/sub_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buddyapp/utils/utils.dart';

import 'model/faculty_model.dart';
import 'model/university_model.dart';

Future<List<UniversityModel>?> getUniversity() async {
   Api api = Api(path:'University');
   final QuerySnapshot<Object?>?  result = await  api.getDataCollection();
   var data = result?.docs;
   List<UniversityModel>? listOfUniversity = data?.map((doc) => UniversityModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfUniversity);
   return listOfUniversity;
 }


Future<List<FacultyModel>?> getFaculty(String collectionId) async {
   Api api = Api(path:'Faculty');
   final QuerySnapshot<Object?>?  result = await  api.getDataCollectionByOtherCollectionID(collectionId,"university_detail_id");
   var data = result?.docs;
   List<FacultyModel>? listOfFaculty = data?.map((doc) => FacultyModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfFaculty);
   return listOfFaculty;
}

Future<List<SemYearModel>?> getSemYear(String collectionId) async {
   Api api = Api(path:'Semester');
   final QuerySnapshot<Object?>?  result = await  api.getDataCollectionByOtherCollectionID(collectionId,"faculty_detail_id");
   var data = result?.docs;
   List<SemYearModel>? listOfSemYear = data?.map((doc) => SemYearModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfSemYear);
   return listOfSemYear;
}

Future<List<SubjectModel>?> getSubject(String collectionId) async {
   Api api = Api(path:'Subject');
   final QuerySnapshot<Object?>?  result = await  api.getDataCollectionByOtherCollectionID(collectionId,"sem_detail_id");
   var data = result?.docs;
   List<SubjectModel>? listOfSubjects = data?.map((doc) => SubjectModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfSubjects);
   return listOfSubjects;
}

Future<List<NotesModel>?> getSubjectData(String collectionId,String collectionName) async {
   Api api = Api(path:collectionName);
   final QuerySnapshot<Object?>?  result = await  api.getDataCollectionByOtherCollectionID(collectionId,"subject_detail_id");
   var data = result?.docs;
   List<NotesModel>? listOfSubjectsData = data?.map((doc) => NotesModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfSubjectsData);
   return listOfSubjectsData;
}