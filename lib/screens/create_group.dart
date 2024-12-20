import 'package:cliques_and_households/models/group_model.dart';
import 'package:cliques_and_households/models/users.dart';
import 'package:cliques_and_households/providers/aux_provider.dart';
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
  final GroupService groupService = GroupService();
  bool isLoading = false;
  int _selectedIndex = 0;
  late TextEditingController _groupNameController;
  late TextEditingController _searchController;
  List<User> members = [];

  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
    _searchController = TextEditingController();
  }

  var uuid = Uuid();

  List<String> getIds() {
    List<String> ids = [];
    members.forEach((element) {
      ids.add(element.userId);
    });
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuxProvider>(builder: (context, auxProvider, _) {
      if (members.isEmpty) {
        groupService.fetchMember(auxProvider.userID!).then((onValue) {
          if (onValue != null) {
            setState(() {
              members.add(onValue);
            });
          }
        });
      }

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
              CustomTextField(
                  hint: "Group Name", controller: _groupNameController),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hint: "Search group name by number",
                controller: _searchController,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    if (members.length == 5) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: const Text(
                                  "You can only add a maximum of 5 members"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"))
                              ],
                            );
                          });
                    } else if (_searchController.text.isNotEmpty) {
                      groupService
                          .fetchMember(_searchController.text)
                          .then((onValue) {
                        if (onValue != null) {
                          bool isPresent = false;
                          members.forEach((member) {
                            if (member.userId == onValue.userId) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(
                                          "User '${_searchController.text}' already added"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              _searchController.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text("OK"))
                                      ],
                                    );
                                  });
                              isPresent = true;
                            }
                          });
                          if (!isPresent) {
                            setState(() {
                              members.add(onValue);
                            });
                          }
                          ;
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: Text(
                                      "User '${_searchController.text}' not found"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _searchController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK"))
                                  ],
                                );
                              });
                        }
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  for (User u in members)
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
                            Text(u.name)
                          ],
                        ),
                      ),
                    )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
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
                    setState(() {
                      isLoading = true;
                    });
                    await groupService
                        .createGroup(Group(
                            groupId: uuid.v4(),
                            groupName: _groupNameController.text,
                            transactions: [],
                            utilities: _selectedIndex == 0 ? null : [],
                            members: members))
                        .whenComplete(() {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }
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
                  child: isLoading
                      ? CircularProgressIndicator.adaptive()
                      : const Text(
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
