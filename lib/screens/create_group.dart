import 'package:cliques_and_households/models/group_model.dart';
import 'package:cliques_and_households/providers/group_service.dart';
import 'package:cliques_and_households/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  int _selectedIndex = 0;
  late TextEditingController _groupNameController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
    _searchController = TextEditingController();
  }

  var uuid = Uuid();
  final GroupService groupService = GroupService();
  @override
  Widget build(BuildContext context) {
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
                initialLabelIndex: _selectedIndex,
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
                  setState(() {
                    _selectedIndex = index!;
                  });
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
                if (_groupNameController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Group name cannot be empty"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        );
                      });
                  return;
                } else {
                  groupService.createGroup(Group(
                      groupId: uuid.v4(),
                      groupName: _groupNameController.text,
                      transactions: [],
                      members: []));
                }
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
  }
}
