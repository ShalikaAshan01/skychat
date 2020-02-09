import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_chat/widgets/delayed_animation.dart';

class Landing1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int delay = 1000;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          DelayedAnimation(
            delay: delay,
            child: Container(
              child: Text(
                "Hello! There,",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          DelayedAnimation(
            delay: delay + 500,
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Welcome to Sky Chat",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          DelayedAnimation(
            delay: delay + 1000,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: FlareActor(
                "assets/flare/animation.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Untitled",
              ),
            ),
          ),
          DelayedAnimation(
            delay: delay + 1500,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Read our privacy policy. Tap \"Start Messaging\" to accept Terms of service",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          DelayedAnimation(
            delay: delay + 2000,
            child: Container(
              padding: const EdgeInsets.only(top: 15),
              child: RaisedButton(
                onPressed: () => Navigator.pushNamed(context, "/landing2"),
                color: Theme.of(context).appBarTheme.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Start Messaging",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
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
