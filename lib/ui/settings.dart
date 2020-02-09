import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_chat/utils/sky_preferences.dart';
import 'package:sky_chat/utils/themes.dart';

import 'SkyInheritedWidget.dart';

class Settings extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  SkyThemeMode skyThemeMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      skyThemeMode = SkyInheritedWidget.of(context).skyThemeMode;
    });
  }

  void _changeThemeMode(SkyThemeMode themeMode){
    setState(() {
      skyThemeMode = themeMode;
    });
    Navigator.pop(context);
    SkyInheritedWidget.of(context).onSkyThemeModeChange(themeMode);
    saveThemeMode(themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            elevation: 10,
            child: Text("Theme Mode"),
            onPressed: (){
              AlertDialog alert = AlertDialog(
                title: Text("App Theme"),
                content: Container(
                  height: 170,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: RadioListTile(
                          selected: skyThemeMode == SkyThemeMode.clearlyWhite,
                          value: SkyThemeMode.clearlyWhite,
                          groupValue: skyThemeMode,
                          title: Text("Clearly White"),
                          onChanged: (newValue) => _changeThemeMode(newValue),
                        ),
                      ),
                      Container(
                        child: RadioListTile(
                          value: SkyThemeMode.kindaDark,
                          selected: skyThemeMode == SkyThemeMode.kindaDark,
                          groupValue: skyThemeMode,
                          title: Text("Kinda Dark"),
                          onChanged: (newValue) => _changeThemeMode(newValue),
                        ),
                      ),
                      Container(
                        child: RadioListTile(
                          value: SkyThemeMode.justBlack,
                          selected: skyThemeMode == SkyThemeMode.justBlack,
                          groupValue: skyThemeMode,
                          title: Text("Just Black"),
                          onChanged: (newValue) => _changeThemeMode(newValue),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              showDialog(context: context,builder: (context)=>alert);
            },
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor,Theme.of(context).accentColor]
              ),
                borderRadius: BorderRadius.circular(15)
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              children: <Widget>[
                _themeItem({SkyThemeColor.primary:Color(0xFF00A3FF),SkyThemeColor.accent:Color(0xFF00b8d4)},SkyTheme.defaultTheme),
                _themeItem(theme1,SkyTheme.theme1),
                _themeItem(theme2,SkyTheme.theme2),
                _themeItem(theme3,SkyTheme.theme3),
                _themeItem(theme4,SkyTheme.theme4),
                _themeItem(theme5,SkyTheme.theme5),
                _themeItem(theme6,SkyTheme.theme6),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _themeItem(themeColors,SkyTheme theme){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: InkWell(
        onTap: (){
          SkyInheritedWidget.of(context).onSkyThemeChange(theme);
          saveTheme(theme);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8.0,
                    offset: Offset(0.0, 1.0),
                    spreadRadius: 2),
              ]
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors:[themeColors[SkyThemeColor.primary],themeColors[SkyThemeColor.accent]],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),

            ),
          ),
        ),
      ),
    );
  }
}