import 'package:cliques_and_households/widgets/custom_button.dart';
import 'package:cliques_and_households/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class MakePaymentBottomsheet extends StatefulWidget {
  const MakePaymentBottomsheet({super.key});

  @override
  State<MakePaymentBottomsheet> createState() => _MakePaymentBottomsheetState();
}

class _MakePaymentBottomsheetState extends State<MakePaymentBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text("Review Bill")),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.06),
              child: CustomTextField(
                hint: "Who are you paying to?",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.06),
              child: CustomTextField(
                hint: "Amount",
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.06),
              child: const Text("Splits"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            SizedBox(
              height: 8,
            ),
            for (int i = 0; i < 3; i++) ...[
              splitRow(),
              const SizedBox(
                height: 20,
              )
            ],
            // const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.2,
                  right: MediaQuery.sizeOf(context).width * 0.29),
              child: const Row(
                children: [Text("Total"), Spacer(), Text("GHS 1000")],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Payment Successful"),
                        content: const Text("Payment was successful"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text("OK"))
                        ],
                      );
                    });
              },
              buttonText: "Pay",
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget splitRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Saint"),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "GHS50",
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: CustomTextField(
                isPercentage: true,
              ))
        ],
      ),
    );
  }
}
