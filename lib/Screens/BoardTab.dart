// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BoardTab extends StatelessWidget {
  const BoardTab({Key? key}) : super(key: key);

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
            onPressed: () {},
          ),
          body: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromRGBO(255, 238, 238, 1),
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Kullanıcı Ad Soyad',
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
                            children: const <Widget>[
                              Icon(Icons.verified, color: Colors.blue),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                              'Örnek anket Örnek anket Örnek anket Örnek anket Örnek anket Örnek anket'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              child: const Text(
                                "#KişiselGelişim",
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.white),
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
                }),
          ),
        ),
      ));
}
