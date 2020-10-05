import 'package:flutter/material.dart';
import 'package:chichat/widgets.dart';
import 'package:chichat/screen/chat_room.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  static const String id = 'Register';
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
                    txt: 'email Address',
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
                    txt: 'Register',
                    func: () {
                      try {
                        Future<UserCredential> user = FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: pwd);
                        if (user != null) {
                          Navigator.pushNamed(context, ChatRoom.id);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password.') {
                          print('password is weak');
                        } else if (e.code == 'email-already-exist') {
                          print('email is already exist.');
                        }
                      } catch (e) {
                        print(e.toString());
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
