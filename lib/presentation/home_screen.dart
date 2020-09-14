import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class Person {
  final String _name;
  final int _score;
  Person(this._name, this._score);
}

class HomeScreen extends StatelessWidget {
  final List<Person> people = [
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
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => Card(
            child: ListTile(
          title: Text(
            people[index]._name,
            style: TextStyle(fontSize: 22.0),
          ),
          trailing: Text(
            people[index]._score.toString(),
            textScaleFactor: 2.0,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.edit)},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
