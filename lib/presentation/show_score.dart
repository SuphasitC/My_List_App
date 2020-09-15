import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';

class ShowScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.edit)},
            backgroundColor: Colors.orange,
          ),
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
                      child: Text('2  Aff',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: Text('90',
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
                            /*fontWeight: FontWeight.bold*/
                          )),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 30,
                      child: Text('1  Em',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 30,
                      child: Text('100',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
          ],
        ));
  }
}
