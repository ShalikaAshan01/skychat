import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Landing2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Landing2State();
}

enum _state{sms,contact,next}
class _Landing2State extends State<Landing2> {
  String _animation;
  String _btnText;
  String _smsChar;
  String _contactChar;
  _state _btnState;

  void setBtnText(){
    String _temp;
    switch(_btnState){
      case _state.sms:
        _temp = "let me access to sms";
        break;
      case _state.contact:
        _temp = "let me access to contacts";
        break;
      case _state.next:
        _temp = "continue";
        break;
    }
    setState(() {
      _btnText = _temp;
    });
  }

  @override
  void initState() {
    super.initState();
    _animation = "idle";
    _btnState = _state.sms;
    _btnText = "let me access to sms";
    _smsChar = "\u2022";
    _contactChar = "\u2022";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _animation = "idle";
      _btnState = _state.sms;
      _btnText = "let me access to sms";
      _smsChar = "\u2022";
      _contactChar = "\u2022";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: double.infinity,
            height: 150,
            child: FlareActor(
              "assets/flare/teddy.flr",
              animation: _animation,
            ),
          ),
          Spacer(),
          Container(
              padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
              child: Text(
            "Sky Chat would like to request following permissions",
            style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,10,10),
            child: Text("$_smsChar Read and write SMS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,10,10),
            child: Text("$_contactChar Read and write Contacts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async{
                setState(() {
                  _animation = "test";
                });
                switch(_btnState){
                  case _state.sms:
                    Map<PermissionGroup, PermissionStatus> sms = await PermissionHandler().requestPermissions([PermissionGroup.sms]);
                    String _tempAnimation;
                    String _tempChar;
                    if(sms[PermissionGroup.sms] == PermissionStatus.granted){
                      _tempAnimation = "success";
                      _tempChar = "\u2714";
                    }
                    else{
                      _tempAnimation = "fail";
                      _tempChar = "\u274c";
                    }

                    setState(() {
                      _smsChar = _tempChar;
                      _animation =_tempAnimation;
                      _btnState = _state.contact;
                    });
                    setBtnText();
                    break;
                  case _state.contact:
                    Map<PermissionGroup, PermissionStatus> contact = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
                    String _tempAnimation;
                    String _tempChar;
                    if(contact[PermissionGroup.contacts] == PermissionStatus.granted){
                      _tempAnimation = "success";
                      _tempChar = "\u2714";
                    }
                    else{
                      _tempAnimation = "fail";
                      _tempChar = "\u274c";
                    }
                    setState(() {
                      _contactChar = _tempChar;
                      _animation =_tempAnimation;
                      _btnState = _state.next;
                    });
                    setBtnText();
                    break;
                  case _state.next:
                    PermissionStatus sms = await PermissionHandler().checkPermissionStatus(PermissionGroup.sms);
                    PermissionStatus contacts = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);

                    if(sms == PermissionStatus.denied){
                      setState(() {
                        _btnState = _state.sms;
                      });
                      setBtnText();
                    }else if(contacts == PermissionStatus.denied){
                        setState(() {
                          _btnState = _state.contact;
                        });
                      setBtnText();
                    }else if(contacts == PermissionStatus.neverAskAgain || contacts == PermissionStatus.neverAskAgain)
                      Navigator.pushNamed(context, "/landing4");
                    else
                      Navigator.pushNamed(context, "/landing3");
                    break;
                }
              }, 
              color: Theme.of(context).appBarTheme.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _btnText.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
