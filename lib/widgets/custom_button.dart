import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  Function() onTap;
  CustomButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.green
              // color: const Color.fromRGBO(226, 233, 240, 1)
              ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
