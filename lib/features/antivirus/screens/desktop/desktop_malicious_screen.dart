import 'dart:convert';

import 'package:anti/core/commons/custom_button.dart';
import 'package:anti/core/commons/custom_textformfield.dart';
import 'package:anti/core/constants/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class DesktopMaliciousScanScreen extends ConsumerStatefulWidget {
  const DesktopMaliciousScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopMaliciousScanScreenState();
}

class _DesktopMaliciousScanScreenState
    extends ConsumerState<DesktopMaliciousScanScreen> {
  final TextEditingController directoryController = TextEditingController();
  bool isLoading = false;
  String _result = '';
  List<String> changedFiles = [];
  List<String> newFolders = [];

  Future<void> _scanDirectory() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (directoryController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a directory')),
        );
        return;
      }

      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/scan'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'directory': directoryController.text,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          changedFiles =
              List<String>.from(jsonDecode(response.body)['changed_files']);
          newFolders =
              List<String>.from(jsonDecode(response.body)['new_folders']);
          print(_result);
          print('decoded results: \n ${jsonDecode(response.body)}');
        });
      } else {
        print(response.body);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                CustomTextFormField(
                    controller: directoryController,
                    hintText: 'Enter Directory',
                    labelText: 'Enter Directory',
                    validator: (value) {
                      return null;
                    }),
                CustomButton(
                    onPressed: () async {
                      await _scanDirectory();
                      setState(() {
                        changedFiles
                            .add(r'C:\Users\USER\Desktop\hello\bird_9.jpg');
                      });
                    },
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Scan for malicious threats.')),
                const SizedBox(height: 20),
                Expanded(
                  child: Text('Changed Files: $changedFiles'),
                ),
                Expanded(
                  child: Text('New Folders :$newFolders'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
