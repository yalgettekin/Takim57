import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'BottomNavigationController.dart';

class SurveyPopup extends StatefulWidget {
  const SurveyPopup({Key? key}) : super(key: key);

  @override
  State<SurveyPopup> createState() => _SurveyPopupState();
}

class _SurveyPopupState extends State<SurveyPopup> {
  late String kategori, anketLinki, anketAdi, aciklama;
  late int anketSuresi;

  kategoriAl(kategoriDegeri) {
    this.kategori = kategoriDegeri;
  }

  anketLinkiAl(anketLinkiDegeri) {
    this.anketLinki = anketLinkiDegeri;
  }

  anketAdiAl(anketAdiDegeri) {
    this.anketAdi = anketAdiDegeri;
  }

  aciklamaAl(aciklamaDegeri) {
    this.aciklama = aciklamaDegeri;
  }

  anketSuresiAl(anketSuresiDegeri) {
    this.anketSuresi = int.parse(anketSuresiDegeri);
  }

  shareSurvey() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Surveys").doc(kategori);
    Map<String, dynamic> Surveys = {
      "kategori": kategori,
      "anketLinki": anketLinki,
      "anketAdi": anketAdi,
      "aciklama": aciklama,
      "anketSuresi": anketSuresi,
    };
    documentReference.set(Surveys).whenComplete(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Anket Paylaşın",
        textAlign: TextAlign.center,
      ),
      actions: [],
      content: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 900,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: Color.fromRGBO(152, 203, 79, 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 8.0, bottom: 2.0),
                      child: SizedBox(
                        height: 30,
                        width: 220,
                        child: TextFormField(
                          onChanged: (String kategoriDegeri) {
                            kategoriAl(kategoriDegeri);
                          },
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Kategori Seçin",
                            focusColor: Colors.white,
                            labelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                          maxLines: 4,
                          cursorHeight: 2,
                          minLines: 1,
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
                      child: SizedBox(
                        height: 30,
                        width: 220,
                        child: TextFormField(
                          onChanged: (String anketLinkiDegeri) {
                            anketLinkiAl(anketLinkiDegeri);
                          },
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Anket Linki",
                            labelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
                      child: SizedBox(
                        height: 30,
                        width: 220,
                        child: TextFormField(
                          onChanged: (String anketAdiDegeri) {
                            anketAdiAl(anketAdiDegeri);
                          },
                          decoration: const InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Anket Adı",
                            labelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 2)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
                      child: SizedBox(
                        height: 30,
                        width: 220,
                        child: TextFormField(
                          onChanged: (String aciklamaDegeri) {
                            aciklamaAl(aciklamaDegeri);
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Anket Açıklaması",
                            labelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 40, top: 8.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Anket Süresi"),
                          SizedBox(
                            width: 45,
                            height: 20,
                            child: TextField(

                              style: TextStyle(
                                fontSize: 12,
                                height: 2),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "minute",
                                contentPadding:
                                EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 45,
                            height: 20,
                            child: TextField(

                              style: TextStyle(
                                  fontSize: 12,
                                  height: 2),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "minute",
                                contentPadding:
                                EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0, bottom: 2.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.0),
                                  ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 10.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("anket degeri:"),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 40.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Icons.share;
                              goToHomeScreen(context);
                              shareSurvey();
                            },
                            child: Text("Paylaş"),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(16, 121, 117, 1),
                              onPrimary: Colors.white,
                            ),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));
