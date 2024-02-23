import 'package:flutter/material.dart';
import 'package:scube_test/src/model/detailmodel.dart';
import 'package:scube_test/src/service/custtomhttp.dart';

class ProjectInfoProvider with ChangeNotifier {
  List<DetailModel> detailsList = [];
  getProjectInfo() async {
    detailsList = await CusttomHttp.getProjectInfo();
    notifyListeners();
  }
}
