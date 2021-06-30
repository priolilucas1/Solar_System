import 'package:flutter/material.dart';

import 'modules/details/details_page.dart';
import 'package:solar_system/shared/models/data.dart';
import 'modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/details':
            return MaterialPageRoute(
              builder: (_) => DetailsPage(settings.arguments! as PlanetInfo),
            );
          case '/home':
          default:
            return MaterialPageRoute(
              builder: (_) => HomePage(),
            );
        }
      },
    );
  }
}
