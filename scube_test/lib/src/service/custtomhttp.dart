import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scube_test/src/model/detailmodel.dart';
import 'package:http/http.dart ' as http;
import 'package:scube_test/widget/custom_msg.dart';

class CusttomHttp {
  static Future<List<DetailModel>> getProjectInfo() async {
    DetailModel detailModel;
    List<DetailModel> detailsList = [];
    String link =
        'https://scubetech.xyz/projects/dashboard/all-project-elements/';
    try {
      var response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          detailModel = DetailModel.fromJson(i);
          detailsList.add(detailModel);
        }
        return detailsList;
      } else {
        throw ("No data found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  static postData(
      TextEditingController idController,
      // DateTime selectedDate,
      TextEditingController startDateController,
      TextEditingController endDateController,
      TextEditingController projectNameController,
      TextEditingController projectUpdateController,
      TextEditingController assignedEngineerController,
      TextEditingController assignedTechnicianController) async {
    String apiUrl =
        'https://scubetech.xyz/projects/dashboard/add-project-elements/';

    Map<String, dynamic> postData = {
      "id": idController.text,
      "start_date": startDateController.text,
      "end_date": endDateController.text,
      "project_name": projectNameController.text,
      "project_update": projectUpdateController.text,
      "assigned_engineer": assignedEngineerController.text,
      "assigned_technician": assignedTechnicianController.text,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 201) {
        return showToast('Data element created successfully');
      } else {
        throw ('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw ('Error during HTTP request: $error');
    }
  }

  static updateDataById(
      TextEditingController idController,
      TextEditingController startDateController,
      TextEditingController endDateController,
      TextEditingController projectNameController,
      TextEditingController projectUpdateController,
      TextEditingController assignedEngineerController,
      TextEditingController assignedTechnicianController) async {
    int id = int.parse(idController.text);
    String apiUrl =
        'https://scubetech.xyz/projects/dashboard/update-project-elements/$id/';

    // Replace the given data with your updated data
    Map<String, dynamic> updatedData = {
      "id": id,
      "start_date": startDateController.text,
      "end_date": endDateController.text,
      "project_name": projectNameController.text,
      "project_update": projectUpdateController.text,
      "assigned_engineer": assignedEngineerController.text,
      "assigned_technician": assignedTechnicianController.text,
    };

    try {
      var response = await http.put(
        Uri.parse(apiUrl), // Append the ID to the URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        return showToast("Data updated successfully");
      } else {
        print('Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw ('Error during HTTP request: $error');
    }
  }
}
