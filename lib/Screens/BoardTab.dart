import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/popup.dart';
import 'package:flutter_application_1/Services/FirebaseFirestoreServices.dart';

class BoardTab extends StatefulWidget {
  const BoardTab({Key? key}) : super(key: key);

  @override
  State<BoardTab> createState() => _BoardTabState();
}

class _BoardTabState extends State<BoardTab> {
  late String kategori, anketLinki, anketAdi, aciklama;
  FirebaseFirestoreService _firebaseFirestoreService =
      FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Anket Panosu'),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Color.fromRGBO(16, 121, 117, 1),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SurveyPopup();
                    });
              },
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: _firebaseFirestoreService.getSurvey(),
              builder: (context, snaphot) {
                return !snaphot.hasData
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: snaphot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot survey = snaphot.data!.docs[index];
                          return Card(
                            color: Color.fromRGBO(255, 238, 238, 1),
                            margin: EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "${survey['name']}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    "@kullanıcıadı",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  tileColor: Colors.black87,
                                  trailing: Wrap(
                                    children: <Widget>[
                                      FirebaseAuth.instance.currentUser != null
                                          ? Icon(Icons.verified,
                                              color: Colors.blue)
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("${survey['description']}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child:  Text(
                                        "# ${survey['category']}",
                                        style: TextStyle(
                                            fontSize: 11.0,
                                            color: Colors.white),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, top: 3.0, bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.monetization_on,
                                        color: Colors.amber,
                                        size: 24.0,
                                      ),
                                      Text("30 Puan")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
              },
            ),
          ),
        ),
      );
}
