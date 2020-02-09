import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class Landing4 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _Landing4State();

}

class _Landing4State extends State<Landing4>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20AA66),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("Grant access",style: TextStyle(color: Colors.white54,fontSize: 30),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("Change permission in your device settings. Give Sky Chat access to SMS and Contacts.",style: TextStyle(fontSize: 20,color: Colors.white),),
          ),
          Spacer(),
          Row(

            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: (){
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text("Exit"),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () async {
                    await PermissionHandler().openAppSettings();
                    Navigator.pop(context);
                  },
                  child: Text("Settings"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}