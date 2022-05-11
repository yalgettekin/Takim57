import 'package:flutter/material.dart';

//Anket sınıfında anketin ismi, açıklaması, kategorisi ve linki bulunuyor
class Survey {
  final String name, description, category, link;

  Survey({
    required this.name,
    required this.description,
    required this.category,
    required this.link,
  });

  /*
  List<Survey> surveys = List.generate(
    demo_survey.length,
    (index) => Survey(
        name: demo_survey[index]['name'],
        description: demo_survey[index]['description'],
        category: demo_survey[index]['category'],
        link: demo_survey[index]['link']),
  );

  //Örnek anket girdileri
  //Bu kısım daha sonra firebase'e bağlanacak */

}
