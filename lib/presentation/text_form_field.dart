import 'package:flutter/material.dart';
import 'package:my_list_score/presentation/person.dart';
import 'package:my_list_score/presentation/global_storage.dart';

class NameTextFormField extends StatefulWidget {
  final Person person;
  NameTextFormField(this.person);

  @override
  _NameTextFormFieldState createState() => _NameTextFormFieldState(this.person);
}

class _NameTextFormFieldState extends State<NameTextFormField> {
  Person person;
  TextEditingController controller;
  _NameTextFormFieldState(this.person);

  setName() {
    store.set("name", controller.text);
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: this.person.name);
    controller.addListener(setName);
    print(this.person.name);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: TextFormField(
          maxLength: 10,
          controller: controller,
          onChanged: setName(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          ),
        ));
  }
}
