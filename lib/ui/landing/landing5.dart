import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';

class Landing5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Landing5State();
}

class _Landing5State extends State<Landing5>{

  double _value = 0.0;

  _loadMessages()async{
    SmsQuery query = SmsQuery();
    List<SmsThread> threads = await query.getAllThreads;

    for(int i=0; i<threads.length; i++){
      print(i);

      List<SmsMessage> messageList = threads[i].messages;

      for(int j=0; j<messageList.length; j++){
        SmsMessage message = messageList[j];

      }

      setState(() {
        _value = (1 / threads.length) * i;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:80,left: 15),
            child: Text("Please give me some moment",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
          Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
            child: LinearProgressIndicator(
              value: _value,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
            child: Text("${_value * 100} %")
          ),
          Spacer()
        ],
      ),
    );
  }
}