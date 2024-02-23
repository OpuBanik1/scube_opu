import 'package:flutter/material.dart';
import 'package:scube_test/src/service/custtomhttp.dart';
import 'package:scube_test/widget/cutom_text.dart';

// ignore: must_be_immutable
class AddProject extends StatefulWidget {
  int pid;
  AddProject({super.key, this.pid = 1});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  // DateTime selectedDate = DateTime.now();
  TextEditingController idController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController projecNameController = TextEditingController();
  TextEditingController projectUpdateController = TextEditingController();
  TextEditingController assignedEnginnerController = TextEditingController();
  TextEditingController assignedTechnicanController = TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2024, 03, 01),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  //   // if (picked != null && picked != selectedDate) {
  //   //   setState(() {
  //   //     returnDate = picked;
  //   //   });
  //   // }
  // }

  @override
  void dispose() {
    idController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    projecNameController.dispose();
    projectUpdateController.dispose();
    assignedEnginnerController.dispose();
    assignedTechnicanController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pid != 1 ? "Update Project data" : "Add Project data",
          style: myStyle(20, Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addButton(idController, "Enter id"),
              const SizedBox(
                height: 5,
              ),
              // GestureDetector(
              //     onTap: () => _selectDate(context),
              //     child: Container(
              //       decoration: const BoxDecoration(
              //           border: Border(),
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(12),
              //           )),
              //       child: Text(
              //         "${selectedDate.toLocal()}".split(' ')[0],
              //         style: myStyle(20, Colors.grey),
              //       ),
              //     )),
              addButton(startDateController, "Start Date"),
              const SizedBox(
                height: 5,
              ),
              addButton(endDateController, "End Date"),
              const SizedBox(
                height: 5,
              ),
              addButton(projecNameController, "Enter project name"),
              const SizedBox(
                height: 5,
              ),
              addButton(projectUpdateController, "Project update"),
              const SizedBox(
                height: 5,
              ),
              addButton(assignedEnginnerController, "Assign engineer"),
              const SizedBox(
                height: 5,
              ),
              addButton(assignedTechnicanController, "Assign Technican"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => widget.pid != 2
                    ? CusttomHttp.postData(
                        idController,
                        startDateController,
                        endDateController,
                        projecNameController,
                        projectUpdateController,
                        assignedEnginnerController,
                        assignedTechnicanController)
                    : CusttomHttp.updateDataById(
                        idController,
                        startDateController,
                        endDateController,
                        projecNameController,
                        projectUpdateController,
                        assignedEnginnerController,
                        assignedTechnicanController),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(widget.pid != 1 ? "Update" : "ADD",
                            style: myStyle(25, Colors.white)))),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField addButton(TextEditingController? controller, String title) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        suffix: Text(title),
        hintText: title,
      ),
    );
  }
}
