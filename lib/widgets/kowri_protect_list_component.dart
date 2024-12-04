import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'kowri_protect_item.dart';
import 'custom_containers.dart';

class KowriProtectListComponent extends StatelessWidget {
  const KowriProtectListComponent(
      {super.key,
      required this.context,
      required this.displayName,
      required this.description,
      required this.itemCount,
      required this.insuranceData});

  final String displayName;
  final String description;
  final int itemCount;
  final dynamic insuranceData;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      scrollDirection: Axis.vertical,
      children: [
        const Gap(16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(displayName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall),
              const Gap(16),
              if (description.isNotEmpty)
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              const Gap(16),
            ],
          ),
        ),
        CustomContainers.kowriCustomContainerRoundedEdges(
          context: context,
          horizontalMargin: 16,
          horizontalPadding: 0,
          verticalPadding: 8,
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                separatorBuilder: (context, index) => Divider(
                  height: 12,
                  indent: 60,
                  endIndent: 20,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                ),
                itemBuilder: (context, index) {
                  double delay = 0.1 * index;
                  Duration duration =
                      Duration(milliseconds: (delay * 1000).round());
                  return Animate(
                      effects: [
                        SlideEffect(duration: duration),
                        FadeEffect(duration: duration),
                      ],
                      child: ListTile(
                        leading: Text("1"),
                      ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
