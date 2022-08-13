


import 'package:buddyapp/main.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_abstract.dart';

 /// Example to call firebase api
/// we will not directly call firebase api in Future provider & then convert it into model
/// csue sooner latter we will shift to our own backend & thne will be mess to refactor the code according to our backend need
/// that's why flow this pattern
/// Future<Welcome> getstudentByID(String id) async {
///   Api api = Api(path:'student');
///   final DocumentSnapshot<Object?>?  result = await  api.getDocumentById("KaZVfkx6IhmQc4bdTEs4");
///   final Map<String, dynamic> data = result?.data() as Map<String, dynamic>;
///   Welcome welcome =  Welcome.fromJson(data);
///   logger.d(e);
///   return welcome;
/// }
///
/// /// when there will be our own backend then the future function will be something like that
/// Future<Welcome> getstudentByID(String id,Map<String, String> insightQuery, {bool enableCache = true}) async {
///
///   String requestUrl = "endpointurl";
///   return getHttpServiceFuture(requestUrl, (json) => Welcome.fromJson(json), queryParams: insightQuery, enableCache: enableCache);
/// }
///
/// Future<List<Welcome>?> getStudent() async {
///   Api api = Api(path:'student');
///   final QuerySnapshot<Object?>?  result = await  api.getDataCollection();
///   var data = result?.docs;
///   List<Welcome>? listOfStudent = data?.map((doc) => Welcome.fromJson(doc.data() as Map<String, dynamic>))
///       .toList();
///   logger.d(gg);
///   return listOfStudent;
/// }
///
///
///
///               //// Model////
/// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
///
/// String welcomeToJson(Welcome data) => json.encode(data.toJson());
///
/// class Welcome {
///   Welcome({
///     required this.name,
///   });
///
///   String name;
///
///   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
///     name: json["name"],
///   );
///
///   Map<String, dynamic> toJson() => {
///     "name": name,
///   };
/// }
/// Write ,Update & delete operation api is easy to use