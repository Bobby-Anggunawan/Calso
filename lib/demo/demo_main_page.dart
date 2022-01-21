import 'package:flutter/material.dart';
import 'demo_home_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'demo_setting_page.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text("Ini menu")
    );
  }
}



class DemoMainPage extends StatefulWidget {
  const DemoMainPage({Key? key}) : super(key: key);

  @override
  _DemoMainPageState createState() => _DemoMainPageState();
}

class _DemoMainPageState extends State<DemoMainPage> {

  List<ScreenHiddenDrawer> itens = [];


  @override
  void initState() {

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Home",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0 ),
          selectedStyle: TextStyle(color: Colors.red.shade900, fontSize: 28.0),
          colorLineSelected: Colors.red.shade900,
        ),
        DemoHomePage()));

    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Setting",
          baseStyle: TextStyle( color: Colors.white, fontSize: 28.0 ),
          selectedStyle: TextStyle(color: Colors.red.shade900, fontSize: 28.0),
          colorLineSelected: Colors.red.shade900,
        ),
        DemoSetting()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: HiddenDrawerMenu(
        backgroundColorMenu: Colors.blue,
        backgroundColorAppBar: Theme.of(context).scaffoldBackgroundColor,
        elevationAppBar: 0,
        screens: itens,
      )
    );
  }
}
