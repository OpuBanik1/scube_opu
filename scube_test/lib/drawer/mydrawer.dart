import 'package:flutter/material.dart';
import 'package:scube_test/drawer/add_project.dart';
import 'package:scube_test/widget/drawer_button.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: Column(
              children: [
                ButtonItem(
                    icon: Icons.add,
                    title: "Add Project Info",
                    clr: Colors.black,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddProject()));
                    }),
                ButtonItem(
                  icon: Icons.update,
                  title: "Update Project Info",
                  clr: Colors.black,
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddProject(
                              pid: 2,
                            )));
                  },
                )
              ],
            ))
          ])),
    );
  }
}

// ignore: must_be_immutable
