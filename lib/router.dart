import 'package:anti/features/antivirus/screens/battery_saver.dart';
import 'package:anti/features/antivirus/screens/malicious_scan_screen.dart';
import 'package:anti/features/antivirus/screens/memory_scan_screen.dart';
import 'package:anti/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedInRoutes = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: HomeScreen()),
  '/malicious-scan': (route) =>
      const MaterialPage(child: MaliciousScanScreen()),
  '/battery-saver': (route) => const MaterialPage(child: BatterySaverScreen()),
  '/memory-scan': (route) => const MaterialPage(child: MemoryScanScreen()),
});
