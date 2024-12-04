import 'package:cliques_and_households/constants/constants.dart';
import 'package:cliques_and_households/widgets/dash_pay_item.dart';
import 'package:flutter/material.dart';

class KowriOptions extends StatelessWidget {
  const KowriOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKowriOptionsContent(context),
          ],
        ),
      ),
    );
  }

  List<void Function()> _getDashPayMenuActions(BuildContext context) => [
        () {},
        () {},
        () {},
        () {},
        () {},
      ];

  Widget _buildKowriOptionsContent(BuildContext context) {
    final dashPayMenuActions = _getDashPayMenuActions(context);
    final options = HomeConstants.getOptions(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What would you like to do?",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 17,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.3,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) => _buildOptionItem(
            context,
            index,
            dashPayMenuActions[index],
            options,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context, int index, VoidCallback onTap,
      Map<String, List<String>> options) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color:
            isDarkMode ? Theme.of(context).colorScheme.surface : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isDarkMode
            ? Border.all(
                color: Colors.grey.withOpacity(0.1),
                width: 1,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withOpacity(0.3)
                : Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DashPayItem(
        subtitle: options.values.elementAt(index)[1],
        title: options.keys.elementAt(index),
        icon: options.values.elementAt(index)[0],
        onTap: onTap,
      ),
    );
  }
}
