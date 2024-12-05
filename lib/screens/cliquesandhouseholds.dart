import 'package:cliques_and_households/models/users.dart';
import 'package:cliques_and_households/models/group_transactions.dart';
import 'package:cliques_and_households/screens/account_card.dart';
import 'package:cliques_and_households/screens/expanded_clique.dart';
import 'package:cliques_and_households/screens/expanded_household.dart';
import 'package:cliques_and_households/widgets/clique_banner.dart';
import 'package:cliques_and_households/screens/create_group.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CliquesAndHousholds extends StatefulWidget {
  const CliquesAndHousholds({super.key});

  @override
  _CliquesAndHousholdsState createState() => _CliquesAndHousholdsState();
}

class _CliquesAndHousholdsState extends State<CliquesAndHousholds> {
  List<Clique> cliques = [Clique()];
  List<Household> households = [Household()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              showDragHandle: true,
              context: context,
              builder: (context) {
                return CreateGroup();
              });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.secondary,
            size: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Cliques & Households",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Cliques"),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: cliques.isEmpty
                  ? Center(
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          child: const Text("No cliques")))
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.09,
                      ),
                      itemCount: cliques.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ExpandedClique(),
                                  ));
                            },
                            child: AccountCard());
                      },
                    ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Households"),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: households.isEmpty
                  ? Center(
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          child: const Text("No households")))
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.09,
                      ),
                      itemCount: households.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ExpandedHousehold(),
                                  ));
                            },
                            child: AccountCard());
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
