import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoChat(avatarURL:"https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg", name:"aa")
  )
  );
}


//todo isme salah

class Bubble extends StatelessWidget {
  Bubble({required this.message, required this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.blue.shade100;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(10.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(20.0),
          );
    double leftMargin= isMe? 10.0 : 50.0;
    double rightMargin= isMe? 50.0 : 10.0;


    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top:5,
            bottom: 5,
            left: leftMargin,
            right: rightMargin
          ),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


class DateHeader extends StatelessWidget {
  const DateHeader({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(date, style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            )
          ]
        )
      )
    );
  }
}


class DemoChat extends StatefulWidget {

  const DemoChat({Key? key, required this.avatarURL, required this.name}) : super(key: key);

  final String avatarURL;
  final String name;

  @override
  State<DemoChat> createState() => _DemoChatState();
}


class _DemoChatState extends State<DemoChat> {

  Widget buildMarquee(String text){
    if(text.length > 13){
      return Marquee(
          text: text,
          style: TextStyle(fontFamily: "Poppins", fontSize: 35),
          blankSpace: 100,
          pauseAfterRound: Duration(seconds: 5),
          startAfter: Duration(seconds: 5)
      );
    }
    else{
      return Text(
          text,
          style: TextStyle(fontFamily: "Poppins", fontSize: 35),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    var textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
            height: 40,
            child: buildMarquee(widget.name)
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.avatarURL)
                )
            )
          ]
      ),

      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [

                DateHeader(date: "7 Januari 2022"),

                Bubble(
                  message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  time: '12:01',
                  delivered: true,
                  isMe: false,
                ),
                Bubble(
                  message: 'Ut enim ad minim veniam',
                  time: '12:01',
                  delivered: true,
                  isMe: true,
                ),
                Bubble(
                  message: 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                  time: '12:01',
                  delivered: true,
                  isMe: true,
                ),
                Bubble(
                  message: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                  time: '12:01',
                  delivered: true,
                  isMe: false,
                ),
                Bubble(
                  message: 'Excepteur sint occaecat cupidatat non proident',
                  time: '12:01',
                  delivered: true,
                  isMe: true,
                ),

                DateHeader(date: "Today"),
                Bubble(
                  message: 'p',
                  time: '12:01',
                  delivered: true,
                  isMe: false,
                ),

              ],
            )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}

