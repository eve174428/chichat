import 'package:flutter/material.dart';
import 'package:chichat/widgets.dart';
import 'package:chichat/screen/chat_room.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  static const String id = 'Login';
  @override
  Widget build(BuildContext context) {
    String email;
    String pwd;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('image/chichat.png'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RoundField(
                    txt: 'email address',
                    type: TextInputType.emailAddress,
                    func: (v) {
                      email = v;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundField(
                    obscure: true,
                    txt: 'password',
                    type: TextInputType.visiblePassword,
                    func: (v) {
                      pwd = v;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundButton(
                    txt: 'Login',
                    func: () {
                      try {
                        Future<UserCredential> user = FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: pwd);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatRoom.id);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          TextEditingController().clear();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
