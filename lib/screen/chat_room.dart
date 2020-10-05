import 'package:flutter/material.dart';
import 'package:chichat/screen/chichat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String msg;

class ChatRoom extends StatelessWidget {
  static const String id = 'ChatRoom';
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'chit-chat',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ChiChat(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (v) {
                        msg = v;
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text('send'),
                    onPressed: () {
                      controller.clear();
                      FirebaseFirestore.instance.collection('messages').add({
                        'message': msg,
                        'user': FirebaseAuth.instance.currentUser.email,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
