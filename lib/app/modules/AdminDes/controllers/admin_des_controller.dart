import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminDesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // OneTime Db
  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference destinasi = firestore.collection('destination');

  //   return destinasi.get();
  // }

  //Realtime Db
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference destinasi = firestore.collection('destination');

    return destinasi.snapshots();
  }
}
