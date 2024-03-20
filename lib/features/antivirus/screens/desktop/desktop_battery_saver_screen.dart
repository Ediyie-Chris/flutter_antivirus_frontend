import 'dart:convert';

import 'package:anti/core/commons/custom_button.dart';
import 'package:anti/core/commons/custom_textformfield.dart';
import 'package:anti/core/constants/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class DesktopBatterySaverScreen extends ConsumerStatefulWidget {
  const DesktopBatterySaverScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopBatterySaverScreenState();
}

class _DesktopBatterySaverScreenState
    extends ConsumerState<DesktopBatterySaverScreen> {
  final TextEditingController ramController = TextEditingController();
  bool isLoading = false;
  String _responseMessage = '';

  void _submitRamLimit() async {
    try {
      setState(() {
        isLoading = true;
      });
      String url = 'http://127.0.0.1:9900/ram-monitor';
      Map<String, dynamic> body = {
        'max_ram_gb': double.parse(ramController.text)
      };
      var response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
      var responseData = json.decode(response.body);

      setState(() {
        _responseMessage = responseData['message'];
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
          Column(
            children: [
              const Text('Set Memory Usage Limit'),
              const SizedBox(height: 20),
              CustomTextFormField(
                  controller: ramController,
                  hintText: 'Set Memory Limit',
                  labelText: 'Set Memory Limit',
                  validator: (value) {
                    return null;
                  }),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: _submitRamLimit,
                child: const Text('Save Battery Live'),
              ),
              Text(
                _responseMessage,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
