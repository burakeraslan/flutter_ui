import 'package:flutter/material.dart';
import 'package:flutter_ui/model/user_data_model.dart';
import 'package:get/get.dart';

class DashboardPageController extends GetxController {
  List<UserDataModel> userData = [
    UserDataModel(
      firstColor: const Color.fromARGB(255, 69, 110, 254),
      secondColor: const Color.fromARGB(119, 69, 110, 254),
      balance: '4,228',
      cent: '.76',
      cardNo: '•••• •••• •••• 8635',
      validFrom: '10/25',
      validThru: '10/30',
      cardHolder: 'Mauro Icardi',
    ),
    UserDataModel(
      firstColor: const Color.fromARGB(255, 45, 198, 136),
      secondColor: const Color.fromARGB(119, 45, 198, 136),
      balance: '2,855',
      cent: '.11',
      cardNo: '•••• •••• •••• 1010',
      validFrom: '04/23',
      validThru: '04/28',
      cardHolder: 'Mauro Icardi',
    ),
  ];
}
