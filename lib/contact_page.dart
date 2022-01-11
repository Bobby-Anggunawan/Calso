import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List")
      ),
      body: FutureBuilder<List<Contact>>(
        future: ContactsService.getContacts(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return Text(snapshot.data![index].displayName!);
                }
            );
          }
          if(snapshot.hasError){
            return Text("error");
          }
          return Text("Loading");
        },
      )
    );
  }
}
