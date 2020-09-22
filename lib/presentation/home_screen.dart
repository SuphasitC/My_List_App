import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/global_storage.dart';
import 'package:my_list_score/presentation/person.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("My List"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => Card(
            color: Colors.grey,
            child: ListTile(
              title: Text(
                (index + 1).toString() + "  " + people[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  shadows: [
                    Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                    Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                    Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                    Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
                  ],
                ),
              ),
              trailing: Text(
                people[index].score.toString(),
                textScaleFactor: 2.0,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                    Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                    Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                    Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
                  ],
                ),
              ),
              onTap: () => {
                Navigator.of(context)
                    .pushNamed(AppRoutes.showScore, arguments: people[index])
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
