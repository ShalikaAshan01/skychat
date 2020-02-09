import 'package:flutter/material.dart';
import 'package:sky_chat/utils/functions.dart';
import 'package:sky_chat/ui/SkyInheritedWidget.dart';
import 'package:sky_chat/utils/themes.dart';
import 'package:sky_chat/widgets/profile_picture.dart';
import 'package:sms_maintained/sms.dart';

import 'chat.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(child: _builder()),
    );
  }

  Widget _builder() {
    SmsQuery query = new SmsQuery();
    return FutureBuilder(
      future: query.getAllThreads,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        List<SmsThread> threads = snapshot.data;
        return ListView.builder(
          itemCount: threads.length,
          itemBuilder: (context, index) {
            SmsThread smsThread = threads[index];
            return ThreadItem(
              smsThread: smsThread,
              profileBackground: getGradientColorByIndex(index),
            );
          },
        );
      },
    );
  }
}

class ThreadItem extends StatelessWidget {
  const ThreadItem({
    Key key,
    @required this.smsThread,
    @required this.profileBackground,
  }) : super(key: key);

  final SmsThread smsThread;
  final profileBackground;

  @override
  Widget build(BuildContext context) {
    final displayName = smsThread.contact?.fullName ?? smsThread.address;
    final message = smsThread.messages[0];
    final img = smsThread.contact.photo;
    final date = showLastMessageTime(message.date);
    final body = message.body;
    final mainColors =
        getSkyThemeMode(SkyInheritedWidget.of(context).skyThemeMode);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Chat(
                messageList: smsThread.messages,
            colors: profileBackground,
            contact: smsThread.contact,
            name: displayName,
              ))),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 45,
              child: ProfilePicture(
                displayName: displayName,
                image: img?.bytes,
                colors: profileBackground,
              ),
              decoration: BoxDecoration(shape: BoxShape.circle),
            ),
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
//                          color: mainColors[ThemeColors.divider],
                            color: Colors.grey.withOpacity(0.3)))),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Positioned(
                        top: 0,
                        child: Text(
                          displayName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: mainColors[ThemeColors.fontColorPrimary]),
                        )),
                    Positioned(
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 5, 2),
                          child: Text(
                            body,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color:
                                    mainColors[ThemeColors.fontColorSecondary],
                                fontSize: 15),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        right: 10,
                        child: Text(
                          date,
                          style: TextStyle(
                              color: mainColors[ThemeColors.fontColorSecondary],
                              fontStyle: FontStyle.italic),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
