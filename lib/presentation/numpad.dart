import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class Numpad extends StatefulWidget {
  Numpad({Key key}) : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String score = '';
  String max = "9999";
  String name = 'eee';

  setValue(String val) {
    setState(() {
      if (score == '0')
        score = val;
      else
        score += val;
      if (int.parse(score) >= int.parse(max)) score = max;
    });
  }

  clear() {
    setState(() {
      score = '0';
    });
  }

  dataSave() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Data Saved!"),
          content: Text(
            "Name: " + this.name + "   Score: " + this.score,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () =>
                  {Navigator.of(context).pushNamed(AppRoutes.home)},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 500.0,
            height: 70.0,
            child: ColoredBox(
              color: Colors.blue[300],
              child: Text(
                this.score,
                textScaleFactor: 3.0,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0), //50
            child: Column(
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
                      onPressed: () => dataSave(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]);
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
        shape: CircleBorder(),
        child: Text(this.text,
            style: TextStyle(fontSize: 22.0, color: Colors.black)),
      ),
    );
  }
}
