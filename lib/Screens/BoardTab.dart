import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/popup.dart';
import 'package:flutter_application_1/Services/FirebaseFirestoreServices.dart';
import 'package:url_launcher/url_launcher.dart';

class BoardTab extends StatefulWidget {
  const BoardTab({Key? key}) : super(key: key);

  @override
  State<BoardTab> createState() => _BoardTabState();
}

class _BoardTabState extends State<BoardTab> {
  late String kategori, anketLinki, anketAdi, aciklama;
  final FirebaseFirestoreService _firebaseFirestoreService =
      FirebaseFirestoreService();
  var url = Uri.parse('https://example.com');

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffc4c4c4),
              title: const Text(
                'Anasayfa',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "SourceSansPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 32.0),
              ),
              centerTitle: true,
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
                    ? const Center(child: CircularProgressIndicator())
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${survey['username']}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  tileColor: Colors.black87,
                                  trailing: Wrap(
                                    children: <Widget>[
                                      FirebaseAuth.instance.currentUser != null
                                          ? const Icon(Icons.verified,
                                              color: Colors.blue)
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(survey['description'].length > 150
                                      ? "${survey['description'].substring(0, 150)}..."
                                      : survey['description']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        "# ${survey['category']}",
                                        style: const TextStyle(
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
                                      right: 15, left: 15, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (!await launchUrl(
                                              Uri.parse(survey['link']))) {
                                            throw 'Could not launch ${survey['link']}';
                                          }
                                        },
                                        child: Text('Ankete Git'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      254, 91, 95, 1)),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.monetization_on,
                                            color: Colors.amber,
                                            size: 24.0,
                                          ),
                                          Text(" ${survey['score']} Puan"),
                                        ],
                                      ),
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
