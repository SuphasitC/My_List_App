import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/person.dart';
import 'package:my_list_score/presentation/global_storage.dart';

class Numpad extends StatefulWidget {
  final Person person;
  Numpad(this.person);

  @override
  _NumpadState createState() => _NumpadState(this.person);
}

class _NumpadState extends State<Numpad> {
  Person person;
  String score;
  String max = "9999";
  _NumpadState(this.person);

  @override
  void initState() {
    super.initState();
    score = this.person.score.toString();
  }

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
    int foundIdx = -1;
    for (int i = 0; i < people.length; i++) {
      if (people[i].name == store.get("name")) {
        foundIdx = i;
        break;
      }
    }
    print("foundIdx = " + foundIdx.toString());
    if (foundIdx == -1) {
      people.add(Person(store.get("name"), int.parse(this.score)));
    } else
      people[foundIdx].score = int.parse(this.score);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Data Saved!"),
          content: Text(
            "Name: " + store.get("name") + "    Score: " + this.score,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.topCenter,
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
        // borderSide: BorderSide(color: Colors.white),
        padding: EdgeInsets.all(30.0),
        onPressed: onPressed,
        shape: CircleBorder(),
        child: Text(this.text,
            style: TextStyle(fontSize: 30.0, color: Colors.white)),
      ),
    );
  }
}
