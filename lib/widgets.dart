import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color whiteColor = Colors.white;
const Color blueColor = Colors.lightBlueAccent;
const BorderRadius roundBorder = BorderRadius.all(Radius.circular(20.0));

class RoundButton extends StatelessWidget {
  final Function func;
  final String txt;
  RoundButton({this.txt, this.func});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: roundBorder),
      color: blueColor,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: TextStyle(color: whiteColor, fontSize: 15.0),
      ),
      onPressed: func,
    );
  }
}

class RoundField extends StatelessWidget {
  final String txt;
  final TextInputType type;
  final bool obscure;
  final Function func;
  RoundField({this.txt, this.type, this.obscure = false, this.func});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      obscureText: obscure,
      textAlign: TextAlign.center,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.3),
        hintText: txt,
        border: OutlineInputBorder(
          borderRadius: roundBorder,
        ),
      ),
      onChanged: func,
    );
  }
}

class MsgBubble extends StatelessWidget {
  final String txt;
  final String sender;
  final bool user;
  MsgBubble({this.txt, this.sender, this.user});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(sender),
        Material(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: TextStyle(color: user ? whiteColor : blueColor),
              )),
          elevation: 3.0,
          color: user ? blueColor : whiteColor,
          borderRadius: user
              ? BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                )
              : BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
        ),
      ],
    );
  }
}
