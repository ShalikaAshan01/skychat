import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget profilePicture;
  final String lastOnline;
  @override
  final Size preferredSize;

   ChatAppBar({Key key,@required this.title, this.profilePicture, this.lastOnline})
      : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.appBarTheme.color,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            color: theme.appBarTheme.color
//            gradient: LinearGradient(
//              colors:[theme.accentColor,theme.primaryColor,theme.accentColor],
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,
//            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: profilePicture,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(title,style: TextStyle(fontSize: 20,color: Colors.white),)),
                        _lastOnlineText()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lastOnlineText(){
    if(lastOnline == null || lastOnline.isEmpty)
      return Container();
    return                         Container(
        child: Text(lastOnline,style: TextStyle(fontSize: 12,color: Colors.white),));
  }

}