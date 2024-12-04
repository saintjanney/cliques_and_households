import 'package:cliques_and_households/widgets/custom_sliver_appbar.dart';
import 'package:cliques_and_households/widgets/kowri_protect_list_component.dart';
import 'package:flutter/material.dart';

class ExpandedClique extends StatelessWidget {
  const ExpandedClique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverAppBar(
              bannerUrl: "https://placehold.co/600x400/png",
              displayName: "Cliques",
              facebookLink: "",
              whatsappLink: "",
              telegramLink: "",
              expandedHeight: MediaQuery.of(context).size.height * .25,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final insurance = [];
                return KowriProtectListComponent(
                  context: context,
                  displayName: "some name",
                  description: "Some description",
                  itemCount: 10,
                  insuranceData: [[]],
                );
              },
              childCount:1,
            ),
          ),
        ],
      ),
    );
  }
}
