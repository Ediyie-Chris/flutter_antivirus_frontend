import 'dart:ui';

import 'package:anti/theme/spectrum.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 0.5,
          sigmaY: 0.5,
        ),
        child: Container(
          color: Spectrum.blackColor.withOpacity(0.6),
        ),
      ),
    );
  }
}
