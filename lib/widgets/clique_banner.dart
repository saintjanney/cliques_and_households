import 'package:cliques_and_households/screens/cliquesandhouseholds.dart';
import 'package:flutter/material.dart';

class CliqueBanner extends StatelessWidget {
  const CliqueBanner({super.key});

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
