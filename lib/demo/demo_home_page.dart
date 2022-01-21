import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'demo_chat_page.dart';
import 'package:marquee/marquee.dart';


class ChatItem extends StatelessWidget {
  const ChatItem({Key? key, required this.avatarURL, required this.name, required this.lastChat, required this.lastChatTime}) : super(key: key);

  final String avatarURL;
  final String name;
  final String lastChat;
  final String lastChatTime;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DemoChat(avatarURL: avatarURL, name: name),
          ),
        );
      },
      child: Container(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(avatarURL,)
                ),

                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: TextStyle(fontFamily: "Poppins", fontSize: 25, color: Colors.black)),
                          Row(
                              children: [
                                Container(
                                    width: 150,
                                    child: Text(lastChat, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle( color: Theme.of(context).disabledColor))
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(lastChatTime,style: TextStyle( color: Colors.blue))
                                )
                              ]
                          )
                        ]
                    )
                ),
              ]
          )
      )
    );
  }
}


class ItemNoChat extends StatelessWidget {
  const ItemNoChat({Key? key, required this.avatarURL, required this.name}) : super(key: key);

  final String avatarURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){

      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(avatarURL,)
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(name, style: TextStyle(fontFamily: "Poppins", fontSize: 25, color: Colors.black)),
                )

              ]
          )
      )
    );
  }
}




class DemoHomePage extends StatefulWidget {
  const DemoHomePage({Key? key}) : super(key: key);

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: (){
          ContactsService.openContactForm();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [

          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Search Contact",
                  fillColor: Colors.white70),
            )
          ),

          ChatItem(
            avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
            name: "Olivia Miller",
            lastChat: "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
            lastChatTime: "2 April 2021"
          ),
          ChatItem(
              avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzeppCoxZPiVk60lL_9s7zbbzfwAKp0aLLKQ&usqp=CAU",
              name: "Chloe Williams",
              lastChat: "sed do eiusmod tempor incididunt ut labore",
              lastChatTime: "2 April 2021"
          ),
          ChatItem(
              avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZWgKYm1KhFbEdLrccsiDSxIjlsp1ZhqCTqw&usqp=CAU",
              name: "Megan Wilson ",
              lastChat: "Sed ut perspiciatis unde omnis iste natus error ",
              lastChatTime: "2 April 2021"
          ),
          ChatItem(
              avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoRKVTxFSE3WZ8I_8srDcqfx4lfsd0MABDJhUoxi8qB1Wb3rkPlcJvhs98h5TfvH50S30&usqp=CAU",
              name: "Hannah Rodriguez",
              lastChat: "Quis autem vel eum iure reprehenderit",
              lastChatTime: "2 April 2021"
          ),


          ItemNoChat(
            avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWe30nEysRbeuAAOM7tY__6s-Fsk_nnfJ92w&usqp=CAU",
            name: "Emily Brown",
          ),
          ItemNoChat(
            avatarURL: "https://www.mynameart.com/pics/name-alfabet-profile-pictures.jpg",
            name: "Sophie Davis",
          ),

          ItemNoChat(
            avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG1twbA82h8OGOa9nwgH0iJZr8efXbm56ogQ&usqp=CAU",
            name: "Lucy Smith",
          ),

          ItemNoChat(
            avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2uYM8qzeXTrpyAlXmhiP4Pmd0-0CyJGpq3Q&usqp=CAU",
            name: "Maia Booker",
          ),

          ItemNoChat(
            avatarURL: "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201912/question-mark-2492009_960_720.jpeg?v1wxXrNBMtHm8XyvxIo2HmtEHb5BENZ0&size=770:433",
            name: "Orla Mosley",
          ),

          ItemNoChat(
            avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHlO3Z_lnzGvrncDglawgC_TBeqYU08Wq3YA&usqp=CAU",
            name: "Kyla Mcdonald",
          ),

          ItemNoChat(
            avatarURL: "https://www.attitudestatus.org/wp-content/uploads/2021/05/dps-8.jpg",
            name: "Cleo Fuller",
          ),

        ],
      )
    );
  }
}
