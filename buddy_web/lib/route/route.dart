import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../main.dart';

final routes = RouteMap(
    routes: {
      '/': (_) => MaterialPage(child: MyApp()),
      '/home/:id': (info) => MaterialPage(child: HomePage(id: info.pathParameters['id'])),
    }
);


class HomePage extends StatefulWidget {
  final String? id;
  const HomePage({Key? key, required this.id}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Text(widget.id as String),
      ),
    );
  }
}
