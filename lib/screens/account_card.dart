import 'package:cliques_and_households/models/users.dart';
import 'package:cliques_and_households/models/group_transactions.dart';
import 'package:cliques_and_households/screens/expanded_clique.dart';
import 'package:cliques_and_households/widgets/custom_logo_icon.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({
    super.key,
  });

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  Color? _dominantColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ExpandedClique(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.symmetric(
            horizontal: 16 * 1.5, vertical: 16 * 1.5),
        decoration: BoxDecoration(
          color: _dominantColor ??
              (isDarkMode
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onPrimaryContainer),
          borderRadius: BorderRadius.circular(15),
          border: isDarkMode
              ? Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                  width: 1,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomLogoIcons(
              imageUrl: "https://placehold.co/50x50",
              height: 50,
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Try",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Try",
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                  // minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
