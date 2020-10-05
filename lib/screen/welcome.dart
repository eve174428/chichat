import 'package:flutter/material.dart';
import 'package:chichat/widgets.dart';
import 'package:chichat/screen/login.dart';
import 'package:chichat/screen/register.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset('image/chichat.png'),
                  ),
                  ColorizeAnimatedTextKit(
                    colors: [
                      Colors.yellow[900],
                      Colors.yellow[300],
                      Colors.yellow[500],
                      Colors.yellow[700],
                      Colors.yellow[900],
                    ],
                    speed: Duration(seconds: 1),
                    text: ['ChiChat'],
                    textStyle: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 50.0,
                    ),
                  ),
                ],
              ),
              RoundButton(
                txt: 'Login',
                func: () {
                  Navigator.pushNamed(context, Login.id);
                },
              ),
              RoundButton(
                txt: 'Register',
                func: () {
                  Navigator.pushNamed(context, Register.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
