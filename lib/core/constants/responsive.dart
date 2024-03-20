// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile() => MediaQuery.of(context).size.width < 850;
    bool isTablet() =>
        MediaQuery.of(context).size.width > 850 &&
        MediaQuery.of(context).size.width <= 1100;

    bool isDesktop() => MediaQuery.of(context).size.width >= 1280;

    if (isMobile()) {
      return mobile;
    } else if (isTablet()) {
      return tablet;
    } else if (isDesktop()) {
      return desktop;
    } else {
      return desktop;
    }
  }
}
