import 'package:flutter/material.dart';
// import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/numpad.dart';

class Edit extends StatelessWidget {
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
                SizedBox(
                    width: 200,
                    child: TextFormField(
                      // controller: nameTextfieldController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
            // SizedBox(
            //   width: 500.0,
            //   height: 70.0,
            //   child: ColoredBox(
            //     color: Colors.blue[300],
            //     child: Text(
            //       '80',
            //       textScaleFactor: 3.0,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //     ),
            //   ),
            // ),
            Numpad()
          ],
        ),
      ),
    );
  }
}
