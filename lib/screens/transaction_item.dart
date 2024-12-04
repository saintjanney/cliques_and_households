import 'package:cliques_and_households/widgets/custom_logo_icon.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10 / 4, horizontal: 10 / 2),
      // onTap: () => showModalBottomSheet(
      //     isScrollControlled: true,
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      //     ),
      //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //     context: (context),
      //     enableDrag: true,
      //     showDragHandle: true,
      //     builder: (context) {
      //       return TransactionDetailBottomSheet(transaction: transaction);
      //     }),
      dense: true,
      title: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            child: Text("Saint Janney",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const Spacer(),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "+ ", style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
                text: "GHS", style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
              text: "100.00",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ]))
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: RichText(
                    text: TextSpan(
                        text: "Some transaction reference",
                        style: Theme.of(context).textTheme.bodySmall),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
              ),
              const Spacer(),
              Text(
                "TODAY",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
      leading: const CustomLogoIcons(
        imageUrl: "https://placehold.co/50x50",
        height: 50,
        width: 50,
      ),
    );
  }
}
