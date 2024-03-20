import 'package:anti/core/constants/filter.dart';
import 'package:anti/theme/spectrum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class DesktopHomeScreen extends ConsumerStatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends ConsumerState<DesktopHomeScreen> {
  navigateToMaliciousScan() {
    Routemaster.of(context).push('/malicious-scan');
  }

  navigateToBatterySaver() {
    Routemaster.of(context).push('/battery-saver');
  }

  navigateToMemoryScan() {
    Routemaster.of(context).push('/memory-scan');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size.height,
            width: double.infinity,
            child: Image.asset(
              'assets/images/anti.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Filter(),
          Positioned(
            top: 0,
            child: Container(
                color: Spectrum.whiteColor,
                width: size.width,
                padding: const EdgeInsets.only(left: 20),
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: navigateToMaliciousScan,
                          child: const Text(
                            'Scan for malware',
                            style: TextStyle(color: Spectrum.blackColor),
                          )),
                      InkWell(
                          onTap: navigateToMemoryScan,
                          child: const Text(
                            'Memory Scan',
                            style: TextStyle(color: Spectrum.blackColor),
                          )),
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            'Firewall Service',
                            style: TextStyle(color: Spectrum.blackColor),
                          )),
                      InkWell(
                          onTap: navigateToBatterySaver,
                          child: const Text(
                            'Battery Saver',
                            style: TextStyle(color: Spectrum.blackColor),
                          )),
                    ])),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'A Fully Functional Antivirus at your service..',
                style: TextStyle(
                  fontSize: 45,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Know the attacks before they happen.',
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
