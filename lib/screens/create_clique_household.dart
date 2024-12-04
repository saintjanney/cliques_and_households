import 'package:cliques_and_households/screens/candhs.dart';
import 'package:flutter/material.dart';

class CreateCliqueHousehold extends StatelessWidget {
  const CreateCliqueHousehold({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const CliquesAndHousholds(),
            ),
          );
        },
        child: Container(
          height: 96,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(226, 233, 240, 1)),
          alignment: Alignment.center,
          child: const Text("Create Clique/Household"),
        ),
      ),
    );
  }
}
