import 'package:flutter/material.dart';

//Anket sınıfında anketin ismi, açıklaması, kategorisi ve linki bulunuyor

// id = Anket id'si
// name = Anket adı
// description = Anket açıklaması
// category = Anket kategorisi
// link = Anket linki
// score = Anket puanı
// username = Anketi paylaşan kullanıcı ad soyad

class Survey {
  String id, name, username, description, category, link;
  int score;

  Survey(
    this.id,
    this.name,
    this.username,
    this.description,
    this.category,
    this.link,
    this.score,
  );

  Survey.fromMap(Map<String, dynamic> map)
      : this(map['id'], map['name'], map['username'], map['description'],
            map['category'], map['score'], map['link']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'description': description,
      'category': category,
      'score': score,
      'link': link,
    };
  }
}
