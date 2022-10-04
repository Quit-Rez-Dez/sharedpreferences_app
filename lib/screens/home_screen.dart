import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

import '../Widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const String routerName='Home';

  const HomeScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode:  ${Preferences.isDarkmode}'),
          Divider(),
          Text('Genero:  ${Preferences.gender}'),
          Divider(),
          Text('Nombre:  ${Preferences.name}'),
          Divider(),
        ],
      )
    );


  }
}
