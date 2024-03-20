import 'package:anti/router.dart';
import 'package:anti/theme/spectrum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Super Anti',
      theme: Spectrum.darkMode,
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        return loggedInRoutes;
      }),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
