import 'package:flutter/material.dart';
import 'package:flutter_ui/models/quick_actions_model.dart';
import 'package:flutter_ui/models/schedule_payments_model.dart';
import 'package:flutter_ui/models/services.dart';
import 'package:flutter_ui/models/user_data_model.dart';
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
    UserDataModel(
      firstColor: const Color.fromARGB(255, 255, 110, 110),
      secondColor: const Color.fromARGB(119, 255, 110, 110),
      balance: '4,552',
      cent: '.55',
      cardNo: '•••• •••• •••• 0999',
      validFrom: '01/22',
      validThru: '01/27',
      cardHolder: 'Mauro Icardi',
    ),
  ];

  List<QuickActionsModel> quickActions = [
    QuickActionsModel(
      title: 'Money Transfer',
      icon: 'assets/images/money_transfer.png',
      color: const Color(0x3313C999),
    ),
    QuickActionsModel(
      title: 'Pay Bill',
      icon: 'assets/images/pay_bill.png',
      color: const Color(0x33456EFE),
    ),
    QuickActionsModel(
      title: 'Bank to Bank',
      icon: 'assets/images/bank_to_bank.png',
      color: const Color(0x338E949A),
    ),
  ];

  List<ServicesModel> services = [
    ServicesModel(
      title: 'Recharge',
      icon: 'assets/icons/recharge.svg',
    ),
    ServicesModel(
      title: 'Charity',
      icon: 'assets/icons/charity.svg',
    ),
    ServicesModel(
      title: 'Loan',
      icon: 'assets/icons/loan.svg',
    ),
    ServicesModel(
      title: 'Gifts',
      icon: 'assets/icons/none.svg',
      // icon: '',
    ),
    ServicesModel(
      title: 'Insurance',
      icon: 'assets/icons/none.svg',
      // icon: '',
    ),
  ];

  List<SchedulePaymentsModel> schedulePayments = [
    SchedulePaymentsModel(
      title: 'Netflix',
      icon: 'assets/images/netflix.png',
      paymentDate: '12/04',
      paymentAmount: '\$1.00',
    ),
    SchedulePaymentsModel(
      title: 'Paypal',
      icon: 'assets/images/paypal.png',
      paymentDate: '14/04',
      paymentAmount: '\$3.50',
    ),
    SchedulePaymentsModel(
      title: 'Spotify',
      icon: 'assets/images/spotify.png',
      paymentDate: '13/04',
      paymentAmount: '\$10.00',
    ),
  ];

  RxInt selectedCard = 0.obs;

  void updateSelectedCard(int index) {
    selectedCard.value = index;
    update();
  }
}
