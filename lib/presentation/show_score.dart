import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/home_screen.dart';

class ShowScore extends StatelessWidget {
  final List<Person> people;
  ShowScore(this.people);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => {
            Navigator.of(context)
                .pushNamed(AppRoutes.edit, arguments: this.people[0])
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
                      child: Text(this.people[0].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: Text(this.people[0].score.toString(),
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
                    this.people[1] != null
                        ? Positioned(
                            left: 30,
                            bottom: 30,
                            child: Text(this.people[1].name,
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
                        child: this.people[1] != null
                            ? Text(this.people[1].score.toString(),
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
