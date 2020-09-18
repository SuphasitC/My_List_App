import 'package:flutter/material.dart';
import 'package:my_list_score/presentation/home_screen.dart';

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
          controller: controller,
          onChanged: setName(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ));
  }
}

class GlobalState {
  final Map<String, String> _data = <String, String>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(String key, String value) => _data[key] = value;
  get(String key) => _data[key];
}

final GlobalState store = GlobalState.instance;
