import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'routes/router.gr.dart' as rte;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder(router: rte.Router()),
      onGenerateRoute: rte.Router().onGenerateRoute,
    );
  }
}
