import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/home_screen.dart';

Person nextPerson(Person current) {
  List<Person> greaterThanCurrent = [];
  int min = 10000;
  people.forEach((element) => {
        if (element.score > current.score) {greaterThanCurrent.add(element)}
      });
  for (int i = 0; i < greaterThanCurrent.length; i++) {
    if (greaterThanCurrent[i].score < min) min = greaterThanCurrent[i].score;
  }
  for (int i = 0; i < people.length; i++) {
    if (people[i].score == min) return people[i];
  }
  return null;
}

class ShowScore extends StatefulWidget {
  final Person person;
  ShowScore(this.person);

  @override
  _ShowScoreState createState() => _ShowScoreState(this.person);
}

class _ShowScoreState extends State<ShowScore> {
  final Person person;
  Person next;
  _ShowScoreState(this.person);

  @override
  void initState() {
    super.initState();
    next = nextPerson(person);
  }

  int idxOfPerson(Person person) {
    return people.indexOf(person) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => {
            Navigator.of(context)
                .pushNamed(AppRoutes.edit, arguments: this.person)
          },
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: 200,
                color: Colors.blue,
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      bottom: 30,
                      child: Text(
                          idxOfPerson(this.person).toString() +
                              ".  " +
                              this.person.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: Text(this.person.score.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
            Container(
                height: 200,
                color: Colors.grey[200],
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      top: 30,
                      child: Text('Next Person >',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                          )),
                    ),
                    this.next != null
                        ? Positioned(
                            left: 30,
                            bottom: 30,
                            child: Text(
                                idxOfPerson(next).toString() +
                                    ".  " +
                                    this.next.name,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold)))
                        : Positioned.fill(
                            top: 120,
                            child: Text("There's no one get higher score.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0))),
                    Positioned(
                        right: 30,
                        bottom: 30,
                        child: this.next != null
                            ? Text(this.next.score.toString(),
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold))
                            : Text(''))
                  ],
                )),
          ],
        ));
  }
}
