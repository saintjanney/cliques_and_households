import 'package:cliques_and_households/models/group_model.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {
  final Group group;
  const GroupCard({
    super.key,
    required this.group,
  });

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding:
          const EdgeInsets.symmetric(horizontal: 16 * 1.5, vertical: 16 * 1.5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.primary,
            backgroundImage: AssetImage(
              widget.group.utilities == null
                  ? "assets/images/clique.jpg"
                  : "assets/images/greg-rosenke-2OrOt0QyNDk-unsplash.jpg",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Members: ${widget.group.members.length}",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.group.groupName,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                // minFontSize: 12,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}
