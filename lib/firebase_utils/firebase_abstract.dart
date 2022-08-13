import 'package:buddyapp/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String? path;
  final model;
  final String? orderBy;
  final String? where;
  CollectionReference? ref;

  Api(this.path, this.model, this.orderBy, this.where) {
    ref = _db.collection(path!);
  }

  // While calling this api If we want to use Future then have to add Api("path",ClassType).getDataCollection().get()
  // if stream then Api("path",ClassType).getDataCollection().snapshots()

  CollectionReference? getDataCollection() {
    return ref?.withConverter(
      fromFirestore: (snapshots, _) => model.fromJson(snapshots.data()!),
      toFirestore: (movie, _) => model.toJson(),
    );
  }

  ///Todo will this below code while we start to make table in firebase
  // Future<QuerySnapshot>? getDataCollection()  {
  //   return ref?.withConverter(
  //     fromFirestore: (snapshots, _) => model.fromJson(snapshots.data()!),
  //     toFirestore: (movie, _) => model.toJson(),
  //   ).orderBy(orderBy!).where(where!).get();
  // }
  //
  // Stream<QuerySnapshot>? streamDataCollection(){
  //   return ref?.withConverter(
  //     fromFirestore: (snapshots, _) => model.fromJson(snapshots.data()!),
  //     toFirestore: (movie, _) => model.toJson(),
  //   ).orderBy(orderBy!).where(where!).snapshots();
  // }

  Future<DocumentSnapshot>? getDocumentById(String documentId) {
    return ref?.doc(documentId).get();
  }

  Future<void>? removeDocument(String documentId) {
    return ref?.doc(documentId).delete();
  }

  Future<void>? addDocument(Map data) {
    return ref?.add(data).then((value) {
      logger.d("doc id = ${value.id}");
    }).catchError((error) {
      logger.e(error);
    });
  }

  Future<void>? updateDoc(Map<String, Object?> data, String documentId) {
    return ref
        ?.doc(documentId)
        .update(data)
        .then((value) => logger.d("doc Updated"))
        .catchError((error) => logger.e("Failed to update doc: $error"));
  }
}
