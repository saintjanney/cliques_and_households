import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hint;
  bool isLookup;
  CustomTextField({super.key, this.hint, this.isLookup = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isLookup
              ? Icon(
                  Icons.search,
                )
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }
}
