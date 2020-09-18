import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/text_form_field.dart';

class Person {
  final String name;
  int score;
  Person(this.name, this.score);
}

List<Person> people = [
  Person("Em", 100),
  Person("Aff", 90),
  Person("Yong", 80),
  Person("Leo", 75)
];

class HomeScreen extends StatelessWidget {
  List<Person> sortPeople(Person personToShow) {
    List<Person> sortedPeople = people;
    List<Person> toShow;
    sortedPeople.sort((current, next) => current.score.compareTo(next.score));
    int curIdx = sortedPeople.indexOf(personToShow);
    int nextIdx = curIdx + 1;

    if (nextIdx < sortedPeople.length)
      toShow = [sortedPeople[curIdx], sortedPeople[nextIdx]];
    else
      toShow = [sortedPeople[curIdx], null];

    return toShow;
  }

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
          onTap: () => {
            Navigator.of(context).pushNamed(AppRoutes.showScore,
                arguments: sortPeople(people[index]))
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          store.set("name", ''),
          Navigator.of(context)
              .pushNamed(AppRoutes.edit, arguments: Person('', 0))
        },
        tooltip: 'Add Person',
        child: Icon(Icons.add),
      ),
    );
  }
}
