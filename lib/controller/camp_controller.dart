import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Camp_Controller extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('destination').get();
    querySnapshot.docs.forEach((doc) {
      print(doc);
    });
  }
}
