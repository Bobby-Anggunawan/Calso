import 'package:calso/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/model/chatList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var repo = Repository();

    return Scaffold(
      appBar: AppBar(
        title: Text("Calso"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.contacts),
        onPressed: (){
          Navigator.pushNamed(context, "/contact");
        }
      ),
      body: FutureBuilder(
          future: repo.getChatList(),
          builder: (BuildContext context, AsyncSnapshot<List<QueryDocumentSnapshot<Object?>>> snapshot){
            if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!;

              //kalo data kosong
              if(data.isEmpty){
                return Text("Tidak ada chat");
              }

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index){
                    return TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/chat", arguments: data[index]["roomID"]);
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              data[index]["personPicture"],
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                          Text(data[index]["personName"]),
                        ]
                      ),
                    );
                  }
              );
            }

            return Text("loading");
          }
      )
    );
  }
}
