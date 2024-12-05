import 'package:cliques_and_households/models/group_model.dart';
import 'package:cliques_and_households/models/group_transactions.dart';
import 'package:cliques_and_households/providers/group_service.dart';
import 'package:cliques_and_households/widgets/groupCard.dart';
import 'package:cliques_and_households/screens/expanded_clique.dart';
import 'package:cliques_and_households/screens/expanded_household.dart';
import 'package:cliques_and_households/widgets/clique_banner.dart';
import 'package:cliques_and_households/screens/create_group.dart';
import 'package:flutter/material.dart';

class CliquesAndHousholds extends StatefulWidget {
  const CliquesAndHousholds({super.key});

  @override
  _CliquesAndHousholdsState createState() => _CliquesAndHousholdsState();
}

class _CliquesAndHousholdsState extends State<CliquesAndHousholds> {
  final GroupService groupService = GroupService();
  // List<Group> groups = [
  //   Group(
  //       groupId: "groupId",
  //       members: [],
  //       transactions: [
  //         Transaction(
  //             transactionId: "transactionId",
  //             groupId: "groupId",
  //             description: "Some description goes here",
  //             timestamp: "timestamp",
  //             amount: "100",
  //             contributions: {
  //               "userId": 100,
  //             }),
  //         Transaction(
  //             transactionId: "transactionId",
  //             groupId: "groupId",
  //             description: "Some description goes here",
  //             timestamp: "timestamp",
  //             amount: "100",
  //             contributions: {})
  //       ],
  //       groupName: "Rock On"),
  //   Group(
  //       groupId: "groupId",
  //       members: [],
  //       groupName: "My Home",
  //       transactions: [],
  //       utilities: List.empty())
  // ];

  @override
  void initState() {
    super.initState();
  }

  // List<Group> get cliques =>
  //     groups.where((group) => group.utilities == null).toList();

  // List<Group> get households =>
  //     groups.where((group) => group.utilities != null).toList();

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
      body: FutureBuilder<List<Group>>(
          future: groupService.getGroups(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Group> groups = snapshot.data ?? [];
            List<Group> cliques =
                groups.where((group) => group.utilities == null).toList();
            List<Group> households =
                groups.where((group) => group.utilities != null).toList();
            return SingleChildScrollView(
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
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
                                              ExpandedClique(
                                            group: cliques[index],
                                          ),
                                        ));
                                  },
                                  child: GroupCard(
                                    group: cliques[index],
                                  ));
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
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
                                  child: GroupCard(
                                    group: households[index],
                                  ));
                            },
                          ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
