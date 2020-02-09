import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{


  @override
  final Size preferredSize;
  final String title;
  final Icon icon;

  CustomAppBar({Key key, this.title, this.icon}) : preferredSize = Size.fromHeight(60.0);



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            color: theme.primaryColor
//            gradient: LinearGradient(
//              colors:[theme.accentColor,theme.primaryColor,theme.accentColor],
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,
//            ),
          ),

        ),
      ),
    );
  }

}