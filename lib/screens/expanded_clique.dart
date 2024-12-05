import 'package:cliques_and_households/widgets/custom_button.dart';
import 'package:cliques_and_households/widgets/custom_sliver_appbar.dart';
import 'package:cliques_and_households/widgets/kowri_protect_list_component.dart';
import 'package:cliques_and_households/widgets/make_payment_bottomsheet.dart';
import 'package:flutter/material.dart';

class ExpandedClique extends StatelessWidget {
  const ExpandedClique({super.key});

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
                opacity: 0.8,
                  image: AssetImage("assets/images/clique.jpg"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-1, -0.5),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
              const Align(
                  alignment: Alignment(-1, 0.625),
                  child: Text(
                    "Clique Members",
                    style: TextStyle(color: Colors.white),
                  )),
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
                          child: const Row(
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
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Transaction History"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: const Text("Saint"),
                );
              }),
        ),
        CustomButton(
            buttonText: "Make Payment",
            onTap: () {
              showModalBottomSheet(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.85),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return MakePaymentBottomsheet();
                  });
            }),
        SizedBox(
          height: 40,
        )
      ]),
    );
  }
}
