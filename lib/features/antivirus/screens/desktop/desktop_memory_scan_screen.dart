import 'dart:convert';

import 'package:anti/core/commons/custom_button.dart';
import 'package:anti/core/constants/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class DesktopMemoryScanScreen extends ConsumerStatefulWidget {
  const DesktopMemoryScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopMemoryScanScreenState();
}

class _DesktopMemoryScanScreenState
    extends ConsumerState<DesktopMemoryScanScreen> {
  // String totalRom = '1';
  // String availableRom = '1';
  // String usedRom = '1';

  Map<String, double> _memoryInfo = {
    'total_memory': 1,
    'available_memory': 1,
    'used_memory': 1,
    'free_memory': 1,
  };

  @override
  void initState() {
    super.initState();
    fetchMemoryInfo();
  }

  Future<void> fetchMemoryInfo() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/memory_info'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _memoryInfo = {
          'total_memory':
              double.parse(data['total_memory'].replaceAll(' GB', '')),
          'available_memory':
              double.parse(data['available_memory'].replaceAll(' GB', '')),
          'used_memory':
              double.parse(data['used_memory'].replaceAll(' GB', '')),
          'free_memory':
              double.parse(data['free_memory'].replaceAll(' GB', '')),
        };
      });
    } else {
      throw Exception('Failed to load memory info');
    }
  }

  // Future<void> fetchDiskInfo() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('http://127.0.0.1:8000//memory_info'));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       setState(() {
  //         totalRom = data['total_rom'];
  //         availableRom = data['available_rom'];
  //         usedRom = data['used_rom'];
  //       });
  //     } else {
  //       print(jsonDecode(response.body));
  //       print('Error: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //       throw Exception('Failed to load disk info');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: StorageSpaceIndicator(
                        spaceLeft: (_memoryInfo['free_memory']!),
                        spaceUsed: (_memoryInfo['used_memory']!),
                        totalSpace: (_memoryInfo['total_memory']!),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text('Total Space: Blue'),
                        Text('Space Used: Red'),
                        Text('Space Left: Green'),
                      ],
                    )
                  ],
                ),
                // Center(
                //   child: StorageSpaceIndicator(
                //     spaceLeft: double.parse(availableRom),
                //     spaceUsed: double.parse(usedRom),
                //     totalSpace: double.parse(totalRom),
                //   ),
                // ),
                const SizedBox(height: 25),
                CustomButton(
                    onPressed: fetchMemoryInfo,
                    child: const Text('Scan Memory'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StorageSpaceIndicator extends StatelessWidget {
  final double spaceLeft;
  final double spaceUsed;
  final double totalSpace;

  StorageSpaceIndicator({
    super.key,
    required this.spaceLeft,
    required this.spaceUsed,
    required this.totalSpace,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 200.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: (totalSpace),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: 15.0,
            backgroundColor: Colors.transparent,
          ),
          CircularProgressIndicator(
            value: (spaceUsed) / (totalSpace),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            strokeWidth: 15.0,
          ),
          CircularProgressIndicator(
            value: (spaceLeft) / (totalSpace),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            strokeWidth: 15.0,
            backgroundColor: Colors.transparent,
          ),
          Center(
            child: Text(
              '${spaceLeft} GB Left',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
