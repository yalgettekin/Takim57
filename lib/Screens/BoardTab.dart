import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/popup.dart';
import 'package:flutter_application_1/Services/FirebaseFirestoreServices.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/StringConstant.dart';
import '../Constants/TextStyleConstant.dart';

class BoardTab extends StatefulWidget {
  const BoardTab({Key? key}) : super(key: key);

  @override
  State<BoardTab> createState() => _BoardTabState();
}

class _BoardTabState extends State<BoardTab> {
  
  late String kategori, anketLinki, anketAdi, aciklama;
  final FirebaseFirestoreService _firebaseFirestoreService =
      FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffc4c4c4),
            title: const Text(
              kOnboardingHomeScreenText,
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RawMaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SurveyPopup();
                                    });
                              },
                              elevation: 2.0,
                              fillColor: const Color.fromRGBO(16, 121, 117, 1),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        child: CupertinoButton(
                            onPressed: () {},
                            child: const Text("Kategorileri Filtrele",
                                style: kCategoryFilterTextStyle),
                            color: Color.fromRGBO(255, 238, 238, 1)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firebaseFirestoreService.getSurvey(),
                      builder: (context, snaphot) {
                        return !snaphot.hasData
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: snaphot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot survey =
                                      snaphot.data!.docs[index];
                                  return Card(
                                    color: Color.fromRGBO(255, 238, 238, 1),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text("${survey['name']}",
                                              style:
                                                  kBoardTabListTileTextStyle),
                                          subtitle: Text(
                                            "${survey['username']}",
                                            style: kBoardTabListTileTextStyle,
                                          ),
                                          tileColor: Colors.black87,
                                          trailing: Wrap(
                                            children: <Widget>[
                                              FirebaseAuth.instance
                                                          .currentUser !=
                                                      null
                                                  ? const Icon(Icons.verified,
                                                      color: Colors.blue)
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(survey['description']
                                                      .length >
                                                  150
                                              ? "${survey['description'].substring(0, 150)}..."
                                              : survey['description']),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              child: Text(
                                                  "# ${survey['category']}",
                                                  style:
                                                      kBoardTabCategoryTextStyle),
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(30),
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
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (!await launchUrl(
                                                          Uri.parse(survey[
                                                              'link']))) {
                                                        throw 'Could not launch ${survey['link']}';
                                                      }
                                                    },
                                                    child: const Text(
                                                        kGoToSurveyText),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(const Color
                                                                      .fromRGBO(
                                                                  254,
                                                                  91,
                                                                  95,
                                                                  1)),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              scrollable: true,
                                                              title: Text(
                                                                  "${survey['name']}"),
                                                              content: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        1.0),
                                                                child: Form(
                                                                  child: Column(
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                          "${survey['description']}"),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 10.0),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.bottomRight,
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Text("# ${survey['category']}", style: kBoardTabCategoryTextStyle),
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.grey,
                                                                              borderRadius: BorderRadius.circular(30),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomRight: Radius.circular(10),
                                                                              bottomLeft: Radius.circular(10)),
                                                                          color: Color.fromRGBO(
                                                                              152,
                                                                              203,
                                                                              79,
                                                                              1),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(5.0),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Image.asset('assets/score.png'),
                                                                                Text(kPreviewScreenScore + "${survey['score']}", style: kBoardTabSurveyScoreTextStyle),
                                                                              ],
                                                                            ),
                                                                            ElevatedButton(
                                                                              onPressed: () async {
                                                                                if (!await launchUrl(Uri.parse(survey['link']))) {
                                                                                  throw 'Could not launch ${survey['link']}';
                                                                                }
                                                                              },
                                                                              child: const Text(kGoToSurveyText, style: kBoardTabButtonTextStyle),
                                                                              style: ButtonStyle(
                                                                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(196, 196, 196, 1)),
                                                                              ),
                                                                            ),
                                                                            const Padding(
                                                                              padding: EdgeInsets.all(5.0),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: const Icon(
                                                      Icons.visibility,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(const Color
                                                                      .fromRGBO(
                                                                  254,
                                                                  185,
                                                                  187,
                                                                  1)),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .green)),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Silmek İstediğine Emin misin?'),
                                                                content: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              45.0),
                                                                      child: ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(Colors
                                                                                  .red)),
                                                                          onPressed:
                                                                              () {},
                                                                          child:
                                                                              Text('Evet')),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              60),
                                                                      child: ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all(Colors
                                                                                  .grey)),
                                                                          onPressed: () => Navigator.pop(
                                                                              context),
                                                                          child:
                                                                              Text('Hayır')),
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Icon(Icons
                                                          .delete_forever_sharp))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/score.png'),
                                                  Text(" ${survey['score']} " +
                                                      kScoreText),
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
                ]),
          ),
        ),
      ));
}
