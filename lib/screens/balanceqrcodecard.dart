import 'package:cliques_and_households/providers/aux_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

class BalanceQrCodeCard extends StatelessWidget {
  final bool showBalance;

  const BalanceQrCodeCard({
    super.key,
    required this.showBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuxProvider>(builder: (conext, auxProvider, _) {
      return Container(
        height: 140,
        width: double.infinity,
        decoration: _boxDecoration(context),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: auxProvider.getBalance(auxProvider.userID!),
                builder: (context, snapshot) {
                  return Expanded(
                      flex: 2,
                      child: _buildBalanceReady(context,
                          snapshot.data!.docs[0]['balance'].toString()));
                }),
            SizedBox(
              height: 81.5,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: VerticalDivider(
                  color: Theme.of(context).dividerColor,
                  thickness: 1,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildQrCodeContent(context),
            ),
          ],
        ),
      );
    });
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDarkMode ? Theme.of(context).colorScheme.surface : Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: isDarkMode
          ? Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              width: 1,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: isDarkMode
              ? Colors.black.withOpacity(0.3)
              : Colors.black.withOpacity(0.1),
          spreadRadius: isDarkMode ? 0 : 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  Widget _buildBalanceReady(BuildContext context, String balance) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Balance",
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodySmall!.color,
                fontFamily: "SF Pro Text",
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              // onTap: onToggleBalance,
              child: Icon(
                showBalance ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).textTheme.bodySmall!.color,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'GHS $balance',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            InkWell(
              // onTap: () => context.push(GoRouterConfig.myAccountsPageRoute),
              child: Text(
                "View Accounts",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "SF Pro Text",
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQrCodeContent(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 95,
            width: 95,
            child: PrettyQrView.data(
              data: 'https://r.kowri.app/0592901239',
              decoration: PrettyQrDecoration(
                shape: PrettyQrSmoothSymbol(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Scan to Pay",
            style: TextStyle(
              fontSize: 10,
              fontFamily: "SF Pro Text",
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          )
        ],
      ),
    );
  }
}
