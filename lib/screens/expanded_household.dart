import 'package:cliques_and_households/widgets/custom_sliver_appbar.dart';
import 'package:cliques_and_households/widgets/kowri_protect_list_component.dart';
import 'package:flutter/material.dart';

class ExpandedHousehold extends StatelessWidget {
  const ExpandedHousehold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/greg-rosenke-2OrOt0QyNDk-unsplash.jpg"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-1, -0.5),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              Align(
                  alignment: Alignment(-1, 0.625),
                  child: Text("Household Members")),
              Align(
                alignment: const Alignment(0, 0.9),
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Saint",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Transaction History"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              // groupService.createGroup();
            },
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.green
                  // color: const Color.fromRGBO(226, 233, 240, 1)
                  ),
              alignment: Alignment.center,
              child: const Text(
                "Make Group Payment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ]),
    );
  }
}
