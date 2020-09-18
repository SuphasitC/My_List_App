import 'package:flutter/material.dart';
import 'package:my_list_score/presentation/numpad.dart';
import 'package:my_list_score/presentation/person.dart';
import 'package:my_list_score/presentation/text_form_field.dart';

class Edit extends StatelessWidget {
  final Person person;
  Edit(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Name",
                  textScaleFactor: 2.0,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                NameTextFormField(this.person)
              ],
            ),
            Numpad(this.person)
          ],
        ),
      ),
    );
  }
}
