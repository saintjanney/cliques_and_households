import 'package:cliques_and_households/screens/balanceqrcodecard.dart';
import 'package:cliques_and_households/widgets/clique_banner.dart';
import 'package:cliques_and_households/screens/home_top_bar.dart';
import 'package:cliques_and_households/screens/recent_transactions.dart';
import 'package:cliques_and_households/widgets/kowri_options.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment.topCenter, children: [
        const HomeTopBar(),
        const Padding(
          padding: EdgeInsets.only(top: 250),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                RecentTransactions(),
                SizedBox(
                  height: 40,
                ),
                KowriOptions(),
                SizedBox(
                  height: 40,
                ),
                CliqueBanner(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 115, left: 17, right: 17),
          child: _buildBalanceQrCodeCard(),
        ),
      ]),
    );
  }

  Widget _buildBalanceQrCodeCard() {
    return const BalanceQrCodeCard(
      showBalance: true,
    );
  }
}
