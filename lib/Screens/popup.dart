
import 'package:cloud_firestore/cloud_firestore.dart';
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anket Paylaşın!",
          style: TextStyle(
            fontFamily: 'Yomogi',
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),

        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                onChanged: (String kategoriDegeri){
                  kategoriAl(kategoriDegeri);
                },
                decoration: const InputDecoration(
                    labelText: "KATEGORİ SEÇİN",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                onChanged: (String anketLinkiDegeri){
                  anketLinkiAl(anketLinkiDegeri);
                },
                decoration: const InputDecoration(
                    labelText: "Anket Linki",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                onChanged: (String anketAdiDegeri){
                  anketAdiAl(anketAdiDegeri);
                },
                decoration: const InputDecoration(
                    labelText: "Anket Adı",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(

                onChanged: (String aciklamaDegeri){
                  aciklamaAl(aciklamaDegeri);
                },
                decoration: const InputDecoration(
                    labelText: "Anket Açıklaması",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Icons.share ;
                      goToHomeScreen(context);
                      shareSurvey();
                    },
                    child: Text("Paylaş!"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ) ,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void shareSurvey() {

  }
}
void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));



