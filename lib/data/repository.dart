import 'package:calso/data/model/chatList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/aMessage.dart';

class Repository{
  //current user data
  static FirebaseAuth? auth = null;

  //firestore reference
  static CollectionReference? chatList = null;
  static CollectionReference? pesan = null;

  String getUserPhone(){
    if(auth == null){
      auth = FirebaseAuth.instance;
    }
    return auth!.currentUser!.phoneNumber!;
  }

  Future<List<QueryDocumentSnapshot<ChatList?>>> getChatList() async{
    if(chatList == null){
      chatList = FirebaseFirestore.instance.collection('chatList');
    }

    //todo gak mau berubah jadi object ChatList.. Tetap dynamic
    List<QueryDocumentSnapshot<ChatList?>> ret = await chatList!.where("me", isEqualTo: getUserPhone()).withConverter<ChatList>(
      fromFirestore: (snapshot, _) => ChatList.fromJson(snapshot.data()!),
      toFirestore: (chatList, _) => chatList.toJson(),
    ).get().then((snapshot) => snapshot.docs);

    return ret;
  }

  Stream<QuerySnapshot<Object?>> getRealtimeChat(String roomID){
    if(pesan == null){
      pesan = FirebaseFirestore.instance.collection('pesan');
    }
    return pesan!.where("roomID", isEqualTo: roomID).snapshots();
  }

  void writeMessage(String message, String roomID){
    if(pesan == null){
      pesan = FirebaseFirestore.instance.collection('pesan');
    }

    pesan!.add(
        Message(
            content: message,
            iSendIt: true,
            roomID: roomID,
            senderName: "bobby",
            timestamp: DateTime.now().millisecondsSinceEpoch
        ).toJson()
    );
  }

}