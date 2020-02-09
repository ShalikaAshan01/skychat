import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sky_chat/utils/functions.dart';
import 'package:sky_chat/utils/themes.dart';

class ProfilePicture extends StatelessWidget{

  final String displayName;
  final colors;
  final Uint8List image;
  final bool circular;
  const ProfilePicture({Key key,@required this.displayName, this.image,@required this.colors, this.circular = true}) : super(key: key);

  Widget _byteImage(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: MemoryImage(image))
      ),
    );
  }

  Widget _placeholder(){
    return Icon(FontAwesomeIcons.user,color: Colors.white70,size: 20,);
  }

  Widget _name(){
    return Text(displayName[0].toUpperCase(),style: TextStyle(color: Colors.white70,fontSize: 22,fontWeight: FontWeight.bold),);
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if(image!=null)
      widget = _byteImage();
    else{
      final temp = displayName.replaceAll("+", "")[0];
      widget = isNumeric(temp)? _placeholder(): _name();
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: widget,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: <Color>[
              colors[SkyGradientColor.primary],
              colors[SkyGradientColor.secondary]
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: circular? BoxShape.circle: BoxShape.rectangle
      ),
    );
  }
}