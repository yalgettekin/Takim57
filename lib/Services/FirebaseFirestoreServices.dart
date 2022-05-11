import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Survey.dart';

Future<List<Survey>> getSurvey(Survey survey) async{
  final querySnapshot = await FirebaseFirestore.instance.collection("Surveys").get();
  return querySnapshot.docs.map((e) => Survey.fromMap(e.data())).toList();


}