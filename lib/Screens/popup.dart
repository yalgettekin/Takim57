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
  late String category, link, name, description;

  categoryAl(categoryDegeri) {
    this.category = categoryDegeri;
  }

  linkAl(linkDegeri) {
    this.link = linkDegeri;
  }

  nameAl(nameDegeri) {
    this.name = nameDegeri;
  }

  descriptionAl(descriptionDegeri) {
    this.description = descriptionDegeri;
  }

 shareSurvey(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Surveys").doc(category);
    Map<String, dynamic> Surveys= {
          "category": category,
          "link": link,
          "name": name,
          "description": description
    };
    documentReference.set(Surveys).whenComplete(() => null);



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

                onChanged: (String categoryDegeri){
                  categoryAl(categoryDegeri);
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

                onChanged: (String linkDegeri){
                  linkAl(linkDegeri);
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

                onChanged: (String nameDegeri){
                  nameAl(nameDegeri);
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

                onChanged: (String descriptionDegeri){
                  descriptionAl(descriptionDegeri);
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

}
void goToHomeScreen(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => const BottomNavigationController()));



