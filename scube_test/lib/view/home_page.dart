import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scube_test/drawer/mydrawer.dart';
import 'package:scube_test/src/model/detailmodel.dart';
import 'package:scube_test/src/provider/projectinfo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    Provider.of<ProjectInfoProvider>(context, listen: false).getProjectInfo();
  }

  @override
  Widget build(BuildContext context) {
    final List<DetailModel> detailList =
        Provider.of<ProjectInfoProvider>(context).detailsList;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            "Project Information",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: detailList.isNotEmpty
              ? ListView.separated(
                  itemCount: detailList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, _) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id= ${detailList[index].id}'),
                          Text('Start Date= ${detailList[index].startDate}'),
                          Text('End Date= ${detailList[index].endDate}'),
                          Text(
                              'Start_day_of_year= ${detailList[index].startDayOfYear}'),
                          Text(
                              'End_day_of_year= ${detailList[index].endDayOfYear}'),
                          Text(
                              'Project_name= ${detailList[index].projectName}'),
                          Text(
                              'Project_update= ${detailList[index].projectUpdate}'),
                          Text(
                              'Assigned_engineer= ${detailList[index].assignedEngineer}'),
                          Text(
                              'Assigned_technician= ${detailList[index].assignedTechnician}'),
                          Text('Duration= ${detailList[index].duration}'),
                        ],
                      ),
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
