import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String? hint;
  Widget? suffixIcon;
  bool isPercentage;
  CustomTextField(
      {super.key,
      this.hint,
      this.isPercentage = false,
      this.suffixIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          suffixIcon:
              suffixIcon ?? (isPercentage ? const Icon(Icons.percent) : null),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
