// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../theme/spectrum.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final double? height;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int? maxLength;
  final Color fillColor;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.maxLines,
    this.maxLength,
    required this.validator,
    this.fillColor = Spectrum.blackColor2,
    this.height,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.only(bottom: 15),
      height: height,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        maxLength: maxLength,
        // maxLength: 20,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Spectrum.whiteColor2,
            ),
            labelStyle: const TextStyle(
              color: Spectrum.whiteColor3,
            ),
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
