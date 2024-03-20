import 'package:anti/core/commons/no_screen.dart';
import 'package:anti/core/constants/responsive.dart';
import 'package:anti/features/antivirus/screens/desktop/desktop_battery_saver_screen.dart';
import 'package:flutter/material.dart';

class BatterySaverScreen extends StatelessWidget {
  const BatterySaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: NoScreen(),
      tablet: NoScreen(),
      desktop: DesktopBatterySaverScreen(),
    );
  }
}
