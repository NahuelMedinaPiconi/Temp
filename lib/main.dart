import 'package:catinteractiu/routes/app_routes.dart';
import 'package:catinteractiu/screens/alert_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components',
      // home: HomePage() 
      initialRoute: "/",
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print("Hem anat a ${  settings.name}");
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertScreen());
      },
    );
  }
}