import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class Person {
  final String name;
  final int score;
  Person(this.name, this.score);
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
            people[index].name,
            style: TextStyle(fontSize: 22.0),
          ),
          trailing: Text(
            people[index].score.toString(),
            textScaleFactor: 2.0,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => {Navigator.of(context).pushNamed(AppRoutes.showScore)},
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .pushNamed(AppRoutes.edit, arguments: Person('', 0))
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/*Navigator.pushNamed(
      context,
      ExtractArgumentsScreen.routeName,
      arguments: ScreenArguments(
        'Extract Arguments Screen',
        'This message is extracted in the build method.',
      ),
    );*/
