import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_chat/utils/functions.dart';
import 'package:sky_chat/ui/home.dart';
import 'package:sky_chat/ui/settings.dart';

class Root extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Root();
}

class _Root extends State<Root>{
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Container(child: Text("2"),),
    Container(child: Text("3"),),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sky Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, "/settings"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}