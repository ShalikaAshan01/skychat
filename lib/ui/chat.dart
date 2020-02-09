import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sky_chat/ui/SkyInheritedWidget.dart';
import 'package:sky_chat/utils/themes.dart';
import 'package:sky_chat/widgets/chat_app_bar.dart';
import 'package:sky_chat/widgets/profile_picture.dart';
import 'package:sms_maintained/contact.dart';
import 'package:sms_maintained/sms.dart';

class Chat extends StatefulWidget{
  final List<SmsMessage> messageList;
  final colors;
  final String name;
  final Contact contact;
  const Chat({Key key, this.messageList, this.colors, this.contact, this.name}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Chat();
}

class _Chat extends State<Chat>{
  IconData _sendIcon;
  bool _openEmoji;
  TextEditingController _textEditingController;


  @override
  void initState() {
    super.initState();
    _sendIcon = Icons.send;
    _openEmoji = false;
    _textEditingController = TextEditingController();
  }

  Future<bool> _willPop(){
    if(_openEmoji)
      _showHideEmoji();
    else
      Navigator.pop(context);
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final boxColor = SkyInheritedWidget.of(context).skyThemeMode == SkyThemeMode.clearlyWhite? Colors.grey: Colors.black;
    final chatText = SkyInheritedWidget.of(context).skyThemeMode == SkyThemeMode.justBlack?
    kindaDark[ThemeColors.background]: Theme.of(context).backgroundColor;

    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: ChatAppBar(
          title: widget.name,
          profilePicture: ProfilePicture(
            colors: widget.colors,
            displayName: widget.name,
            image: widget.contact.photo?.bytes,
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: _builder()),
              Container(
                constraints: BoxConstraints(
                  minHeight: 50,
                  maxHeight: MediaQuery.of(context).size.height * 0.15
                ),
                margin:const EdgeInsets.only(left: 8,bottom: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding:const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: TextField(
                              decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _textEditingController,
                            ),
                            ),
                            GestureDetector(
                              onTap: ()=> _showHideEmoji(),
                              child: Container(
                                padding: const EdgeInsets.only(right: 10),
                                  child: Icon(FontAwesomeIcons.smile)),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: chatText,
                            borderRadius: BorderRadius.circular(25),
                          boxShadow: [BoxShadow(
                            color: boxColor,
                            blurRadius: 5.0,
                          ),]
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: GestureDetector(
                        onTap: (){
                          //TODO:send
                          print("press send");
                        },
                        child: Card(
//                        margin: const EdgeInsets.all(3),
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: Theme.of(context).primaryColor,
                          child: Align(
                            alignment: Alignment.center,
                              child: Icon(_sendIcon)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _emojiPicker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builder() {
    DateTime prev;
    return ListView.builder(
      reverse: true,
      itemCount: widget.messageList.length,
      itemBuilder: (context, index){
        SmsMessage message = widget.messageList[index];
        bool sent = message.kind == SmsMessageKind.Sent;
        DateTime date = message.date;
        bool another = true;
        if(prev != null){
          if(prev.day != date.day || prev.difference(date).inDays > 1)
            another = true;
          else
            another = false;
        }

        prev = date;
      return ChatListItem(context: context, message: message.body, sent: sent, contact: widget.contact, colors: widget.colors, name: widget.name,dateTime: date,anotherDay: another,);
      },
    );
  }

  void _showHideEmoji() {
    setState(() {
      _openEmoji = !_openEmoji;
    });
  }

  Widget _emojiPicker() {

    if(_openEmoji)
      return EmojiPicker(
        rows: 3,
        columns: 7,
        numRecommended: 0,
        onEmojiSelected: (emoji, category) {
          _textEditingController.text += emoji.emoji;

        },
      );
    else
      return Container();
  }
}

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    Key key,
    @required this.context,
    @required this.message,
    @required this.sent,@required this.colors,@required this.name,@required this.contact,@required this.dateTime, this.anotherDay = false,
  }) : super(key: key);

  final BuildContext context;
  final String message;
  final bool sent;
  final bool anotherDay;
  final colors;
  final String name;
  final DateTime dateTime;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mainAlignment =  sent? MainAxisAlignment.end : MainAxisAlignment.start;
    final alignment =  sent? Alignment.centerRight : Alignment.centerLeft;
    final color1 = sent? Theme.of(context).primaryColor: Color(0xFFE7E5E7);
    final color2= sent? Theme.of(context).accentColor: Color(0xFFE7E5E7);
    final textColor = sent? Color(0xFFE7E5E7): Color(0xFF203053);
    BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [color1,color2],
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(8),
    );
    if(SkyInheritedWidget.of(context).skyTheme == SkyTheme.defaultTheme)
      decoration = BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(8),
      );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _groupByDate(),
          Row(
            mainAxisAlignment: mainAlignment,
            children: <Widget>[
              _picture(),
              Container(
                alignment: alignment,
                width: width * 0.9 - 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    decoration: decoration,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(message,style: TextStyle(color: textColor),),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(DateFormat("hh:mm aa").format(dateTime),style: TextStyle(fontSize: 12,color: textColor.withOpacity(0.6)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _groupByDate() {

    String date = DateFormat("dd MMM").format(dateTime);
    if(dateTime.year != DateTime.now().year)
      date = DateFormat("dd MMM yyyy").format(dateTime);

    if(!anotherDay)
      return Container();
    return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(date,style: TextStyle(color: Colors.white70),),
              ))
      ,);
  }
  Container _picture() {
    if(sent)
      return Container();
    return Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: ProfilePicture(
              colors: colors,
              displayName: name,
              image: contact.photo?.bytes,
            ),
          ),
        );
  }
}