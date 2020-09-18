import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/home_screen.dart';
import 'package:my_list_score/presentation/edit.dart';
import 'package:my_list_score/presentation/show_score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyList App',
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        // AppRoutes.edit: (context) => Edit(),
        // AppRoutes.showScore: (context) => ShowScore(),
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _registerRouteWithParameters,
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings) {
  Person person = settings.arguments;
  if (settings.name == AppRoutes.edit) {
    return MaterialPageRoute(builder: (context) {
      // Person person = settings.arguments;
      return Edit(person);
    });
  }
  if (settings.name == AppRoutes.showScore) {
    return MaterialPageRoute(builder: (context) {
      // Person clickedAndNext = settings.arguments;
      return ShowScore(person);
    });
  }
}
