import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:80,left: 15),
            child: Text("Do you want to back up your device's messages?",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          Container(
            margin:const EdgeInsets.only(top: 50),
            width: double.infinity,
            height: 150,
            child: FlareActor(
              "assets/flare/sms_verify.flr",
              animation: "animate",
            ),
          ),
          SizedBox(height: 10,),
          Text("I don't store your messages in cloud",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 16),),
          Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 12,right: 12),
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/landing5"),
              color: Theme.of(context).appBarTheme.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Yes! Please",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),

          Container(
            padding: const EdgeInsets.only(left: 12,right: 12),
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, "/root"),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "No! Thanks",
                  style: TextStyle( fontSize: 16),
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}