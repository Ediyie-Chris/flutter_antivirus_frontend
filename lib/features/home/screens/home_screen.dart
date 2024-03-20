import 'package:anti/core/commons/no_screen.dart';
import 'package:anti/core/constants/responsive.dart';
import 'package:anti/features/home/screens/desktop/desktop_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: NoScreen(),
      tablet: NoScreen(),
      desktop: DesktopHomeScreen(),
    );
  }
}
