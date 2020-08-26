import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Name",
                  textScaleFactor: 2.0,
                ),
                // TextField(
                //   decoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintText: 'Enter a search term'),
                // ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                child: Text("7"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("8"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("9"),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                child: Text("4"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("5"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("6"),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                child: Text("1"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("2"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("3"),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(
                onPressed: () => {},
                child: Text("CLR"),
              ),
              RaisedButton(
                onPressed: () => {},
                child: Text("0"),
              ),
              RaisedButton(
                onPressed: () =>
                    {Navigator.of(context).pushNamed(AppRoutes.home)},
                child: Text("OK"),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
