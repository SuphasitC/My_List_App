import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/for_passing.dart';

class Person {
  final String _name;
  final int _score;
  Person(this._name, this._score);
}

class HomeScreen extends StatelessWidget {
  List<Person> mock = [
    Person("Em", 100),
    Person("Aff", 90),
    Person("Yong", 80),
    Person("Leo", 75)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
              child: ListTile(
            title: Text(mock[0]._name),
            trailing: Text(
              mock[0]._score.toString(),
              textScaleFactor: 2.0,
            ),
            onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
          )),
          Card(
              child: ListTile(
            title: Text(mock[1]._name),
            trailing: Text(
              mock[1]._score.toString(),
              textScaleFactor: 2.0,
            ),
            onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
          )),
          Card(
              child: ListTile(
            title: Text(mock[2]._name),
            trailing: Text(
              mock[2]._score.toString(),
              textScaleFactor: 2.0,
            ),
            onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
          )),
          Card(
              child: ListTile(
            title: Text(mock[3]._name),
            trailing: Text(
              mock[3]._score.toString(),
              textScaleFactor: 2.0,
            ),
            onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.edit)},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
