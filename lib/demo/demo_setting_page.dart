import 'package:flutter/material.dart';
import 'demo_home_page.dart';




class DemoSetting extends StatelessWidget {
  const DemoSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ItemNoChat(
            avatarURL: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg",
            name: "Bobby Ang",
          ),
          ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              Container(
                child: ListTile(
                  title: Text('Account'),
                  subtitle: Text('Privacy, security, change phone number'),
                  leading: Icon(Icons.manage_accounts, color: Colors.blue,),
                ),
                height: 75
              ),
              Container(
                child: ListTile(
                  title: Text('Chat'),
                  subtitle: Text('Themes, wallpapers, chat history'),
                  leading: Icon(Icons.forum, color: Colors.blue),
                ),
                height: 75
              ),
              Container(
                child: ListTile(
                  title: Text('Notifications'),
                  subtitle: Text('Messages, groups & and call ringtones'),
                  leading: Icon(Icons.notifications, color: Colors.blue),
                ),
                height: 75,
              ),
              Container(
                child: ListTile(
                  title: Text('Help Center'),
                  subtitle: Text('Help center, contact us, privacy policy'),
                  leading: Icon(Icons.help_center, color: Colors.blue),
                ),
                height: 75,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.logout_outlined),
                  onPressed: () {
                    // Respond to button press
                  },
                  label: Text('Log Out'),
                )
              )
            ]
          )
        ]
      )
    );
  }
}
