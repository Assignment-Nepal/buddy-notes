

import 'package:buddyapp/firebase_utils/firebase_abstract.dart';
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
   final QuerySnapshot<Object?>?  result = await  api.getDataCollectionByOtherCollectionID(collectionId);
   var data = result?.docs;
   List<FacultyModel>? listOfFaculty = data?.map((doc) => FacultyModel.fromJson(doc.data() as Map<String, dynamic>))
       .toList();
   logger.d(listOfFaculty);
   return listOfFaculty;
}