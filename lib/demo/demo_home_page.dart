import 'package:flutter/material.dart';

import 'demo_chat_page.dart';


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




class DemoHomePage extends StatelessWidget {
  const DemoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calso", style: TextStyle(fontFamily: "Poppins", fontSize: 35)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: (){

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
              avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
              name: "Chloe Williams",
              lastChat: "sed do eiusmod tempor incididunt ut labore",
              lastChatTime: "2 April 2021"
          ),
          ChatItem(
              avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
              name: "Megan Wilson ",
              lastChat: "Sed ut perspiciatis unde omnis iste natus error ",
              lastChatTime: "2 April 2021"
          ),
          ChatItem(
              avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
              name: "Hannah Rodriguez",
              lastChat: "Quis autem vel eum iure reprehenderit",
              lastChatTime: "2 April 2021"
          ),


          ItemNoChat(
            avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
            name: "Emily Brown",
          ),
          ItemNoChat(
            avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
            name: "Sophie Davis",
          ),
          ItemNoChat(
            avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
            name: "Lucy Smith",
          ),

        ],
      )
    );
  }
}
