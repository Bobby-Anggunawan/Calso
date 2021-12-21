import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //ambil nomor telpon
    //todo keknya mau dihapus
    FirebaseAuth auth = FirebaseAuth.instance;
    String phoneNum = "null";
    if(auth.currentUser?.phoneNumber != null){
      phoneNum = auth.currentUser!.phoneNumber!;
    }

    //read data
    CollectionReference chatList = FirebaseFirestore.instance.collection('chatList');

    return Scaffold(
      appBar: AppBar(
        title: Text("Calso"),
      ),
      body: FutureBuilder(
          future: chatList.where("me", isEqualTo: phoneNum).get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.docs;

              //kalo data kosong
              if(data.isEmpty){
                return Text("Tidak ada chat");
              }

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index){
                    return TextButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              data[index]['personPicture'],
                              height: 150.0,
                              width: 100.0,
                            ),
                          ),
                          Text(data[index]['personName']),
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
