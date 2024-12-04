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
        child: Image.asset("assets/images/cliques_button.png"),
      ),
    );
  }
}
