import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Survey.dart';


class FirebaseFirestoreService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getSurvey() {
    var ref = _firestore.collection("Surveys").snapshots();
    return ref;
  }
}