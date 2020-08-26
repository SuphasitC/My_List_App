import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class ShowScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("Aff"), Text("90")],
            ),
            Column(
              children: <Widget>[
                Text("Next Person >"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[Text("Em"), Text("100")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
