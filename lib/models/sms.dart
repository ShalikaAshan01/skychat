import 'package:flutter/cupertino.dart';

class SmS{
  int id;
  String message;
  DateTime dateTime;
  String uri;
  bool send;
  String address;

  SmS({this.id,@required this.message,@required this.dateTime,@required this.uri,@required this.send,@required this.address});

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    if(id != null)
      map['id'] = id;

    map['address'] = address;
    map['message'] = message;
    map['dateTime'] = dateTime;
    map['uri'] = uri;
    map['send'] = send;
    return map;
  }

  SmS.fromMapObject(Map<String,dynamic> map){
    this.id= map['id'];
    this.address = map['address'];
    this.message = map['message'];
    this.dateTime = map['dateTime'];
    this.uri = map['uri'];
    this.send = map['send'];
  }
}