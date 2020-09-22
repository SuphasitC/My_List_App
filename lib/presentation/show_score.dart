import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/person.dart';

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
        backgroundColor: Colors.black,
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
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      color: Colors.grey,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "Next Person >",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () => {
                          setState(() {
                            next = nextPerson(next);
                          })
                        },
                      ),
                    ),
                    Container(
                      height: 110,
                      padding: EdgeInsets.all(20.0),
                      color: Colors.blue,
                      child: this.next != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  Text(
                                      idxOfPerson(next).toString() +
                                          ".  " +
                                          this.next.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                offset: Offset(-1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, 1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(-1.5, 1.5),
                                                color: Colors.black),
                                          ],
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text(
                                      this.next != null
                                          ? this.next.score.toString()
                                          : "",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                offset: Offset(-1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, -1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(1.5, 1.5),
                                                color: Colors.black),
                                            Shadow(
                                                offset: Offset(-1.5, 1.5),
                                                color: Colors.black),
                                          ],
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ])
                          : Text("There's no one get higher score than me",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        offset: Offset(-1.5, -1.5),
                                        color: Colors.black),
                                    Shadow(
                                        offset: Offset(1.5, -1.5),
                                        color: Colors.black),
                                    Shadow(
                                        offset: Offset(1.5, 1.5),
                                        color: Colors.black),
                                    Shadow(
                                        offset: Offset(-1.5, 1.5),
                                        color: Colors.black),
                                  ],
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                    )
                  ],
                )),
          ],
        ));
  }
}
