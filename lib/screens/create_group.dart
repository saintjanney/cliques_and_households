import 'package:cliques_and_households/providers/gorup_service.dart';
import 'package:cliques_and_households/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GorupService>(builder: (context, groupService, _) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Create Group",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ToggleSwitch(
                  minWidth: double.infinity,
                  initialLabelIndex: 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ['Clique', 'Household'],
                  icons: const [Icons.group, Icons.home],
                  activeBgColors: const [
                    [Colors.green],
                    [Colors.green],
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(hint: "Group Name"),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hint: "Search group name by number",
                isLookup: true,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Saint")
                          ],
                        ),
                      ),
                    )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  groupService.createGroup();
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green
                      // color: const Color.fromRGBO(226, 233, 240, 1)
                      ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Create Group",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      );
    });
  }
}
