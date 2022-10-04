import 'package:flutter/material.dart';
import 'package:preferences_app/Widgets/widgets.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';



class SettingsScreen extends StatefulWidget {

  static const String routerName='Settings';


  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  /*bool isDarkModer= false;
  int gender =1;
  String name ='Pedro';*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: const SideMenu(),
      body:SingleChildScrollView(
        child: Column(
          children: [
            const Text('Ajustes',style: TextStyle( fontSize: 45, fontWeight:  FontWeight.w300),),
            const Divider(),

            /*SwitchListTile.adaptive(
                value: true,
                title: const Text('Darkmode'),
                onChanged: (value){
                  isDarkModer=value;
                  setState(() {});

                }),*/

          SwitchListTile(
            title: const Text('Darkmode'),
            value: Preferences.isDarkmode,
            onChanged: (bool value) {
              Preferences.isDarkmode = value;
              final themeProvider=Provider.of<ThemeProvider>(context,listen: false);

              value ? themeProvider.setDarkMode()
              : themeProvider.setLighMode();

              setState(() {
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
            const Divider(),

            RadioListTile<int>(
                value: 1,
                groupValue:  Preferences.gender,
                title: const Text('Masculino'),
                onChanged: ( value ){
                  Preferences.gender= value ?? 1;
                  setState(() {});
                }),
            const Divider(),

            RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: ( value ){
                  Preferences.gender= value ?? 1;
                  setState(() {});
                }),
            const Divider(),

            Padding(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged:  (value){
                  Preferences.name = value ;
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuartio '
                ),
              ),
            )

          ],

        ),
      )
    );
  }
}
