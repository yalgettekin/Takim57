import 'package:flutter/material.dart';

//Anket sınıfında anketin ismi, açıklaması, kategorisi ve linki bulunuyor
class Survey {
  String name, description, category, link;

  Survey(this.name,
      this.description,
      this.category,
      this.link,);

  Survey.fromMap(Map<String, dynamic> map)
      :this(map['name'], map['description'], map['category'],
      map['link']);

  Map<String, dynamic> toMap() {
    return {
      'name':'name',
      'description':description,
      'category':category,
      'link':link,
    };
  }
}
