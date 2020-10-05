import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chichat/widgets.dart';

class ChiChat extends StatefulWidget {
  @override
  _ChiChatState createState() => _ChiChatState();
}

class _ChiChatState extends State<ChiChat> {
  @override
  Widget build(BuildContext context) {
    String currentUser = FirebaseAuth.instance.currentUser.email;
    FirebaseFirestore store = FirebaseFirestore.instance;
    return StreamBuilder(
      stream: store
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        List<Widget> msgWidget = [];
        if (snapshot.data.docs == null) {
          snapshot.data.docs.forEach((stream) {
            String msg = stream.data()['message'];
            String sender = stream.data()['user'];
            msgWidget.add(MsgBubble(
              txt: msg,
              sender: sender,
              user: sender == currentUser,
            ));
          });
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            reverse: true,
            children: msgWidget,
          ),
        );
      },
    );
  }
}
