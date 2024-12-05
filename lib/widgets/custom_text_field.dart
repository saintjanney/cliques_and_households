import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  bool isLookup;
  bool isPercentage;
  CustomTextField(
      {super.key, this.hint, this.isLookup = false, this.isPercentage = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isLookup
              ? Icon(
                  Icons.search,
                )
              : isPercentage
                  ? Icon(Icons.percent)
                  : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
