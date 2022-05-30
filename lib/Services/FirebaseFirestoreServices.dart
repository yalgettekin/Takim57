import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final DocumentReference reff;
  Future deleteSurvey(String docId) async {
    try {
      await _firestore.collection('Surveys').doc(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  //firestoredan anket verisi çekme metodu
  Stream<QuerySnapshot> getSurvey() {
    var ref = _firestore.collection("Surveys").snapshots();
    return ref;
  }
}
