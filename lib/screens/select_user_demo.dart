import 'package:cliques_and_households/models/users.dart';
import 'package:cliques_and_households/providers/aux_provider.dart';
import 'package:cliques_and_households/providers/group_service.dart';
import 'package:cliques_and_households/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectUserDemo extends StatelessWidget {
  final GroupService groupService = GroupService();
  SelectUserDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
          future: groupService.fetchMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: Column(
                    children: [
                      Text("Select user start demo"),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Consumer<AuxProvider>(
                                  builder: (context, auxProvider, _) {
                                return ListTile(
                                  leading: Text("${index + 1}"),
                                  onTap: () {
                                    auxProvider.setUserID(
                                        snapshot.data![index].userId);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  title: Text(snapshot.data![index].name),
                                  trailing: Icon(Icons.arrow_forward),
                                  subtitle: Text(snapshot.data![index].name),
                                );
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Placeholder();
          }),
    );
  }
}
