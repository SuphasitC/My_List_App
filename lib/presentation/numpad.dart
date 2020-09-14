import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Numpad extends StatefulWidget {
  Numpad({Key key}) : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String score = '';

  setValue(String val) {
    setState(() {
      score += val;
    });
  }

  clear() {
    setState(() {
      score = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '1',
                onPressed: () => setValue('1'),
              ),
              NumpadButton(
                text: '2',
                onPressed: () => setValue('2'),
              ),
              NumpadButton(
                text: '3',
                onPressed: () => setValue('3'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '4',
                onPressed: () => setValue('4'),
              ),
              NumpadButton(
                text: '5',
                onPressed: () => setValue('5'),
              ),
              NumpadButton(
                text: '6',
                onPressed: () => setValue('6'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '7',
                onPressed: () => setValue('7'),
              ),
              NumpadButton(
                text: '8',
                onPressed: () => setValue('8'),
              ),
              NumpadButton(
                text: '9',
                onPressed: () => setValue('9'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: 'CLR',
                onPressed: () => clear(),
              ),
              NumpadButton(
                text: '0',
                onPressed: () => setValue('0'),
              ),
              NumpadButton(
                text: 'OK',
                onPressed: () => setValue('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const NumpadButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.black),
        padding: EdgeInsets.all(30.0),
        onPressed: onPressed,
        // shape: CircleBorder(),
        child: Text(this.text,
            style: TextStyle(fontSize: 22.0, color: Colors.black)),
      ),
    );
  }
}
