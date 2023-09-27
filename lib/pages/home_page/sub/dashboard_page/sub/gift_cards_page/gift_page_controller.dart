import 'package:flutter/material.dart';
import 'package:flutter_ui/models/gifts_model.dart';
import 'package:get/get.dart';

class GiftPageController extends GetxController {
  List<GiftsModel> gifts = [
    GiftsModel(title: 'Eid', image: 'assets/images/eid.png', cashback: '10%', isSelect: false),
    GiftsModel(
      title: 'Birthday',
      image: 'assets/images/birthday.png',
      cashback: '20%',
      isSelect: false,
    ),
    GiftsModel(
      title: 'Marriage',
      image: 'assets/images/marriage.png',
      cashback: '10%',
      isSelect: false,
    ),
  ];

  void selectGift(int index) {
    for (int i = 0; i < gifts.length; i++) {
      if (i == index) {
        gifts[i].isSelect = !gifts[i].isSelect;
      } else {
        gifts[i].isSelect = false;
      }
    }
    update();
  }

  bool obscureText = false;

  void updateObscureText() {
    obscureText = !obscureText;
    update();
  }

  TextEditingController amountController = TextEditingController();

  List amountList = [
    '100',
    '150',
    '200',
  ];

  bool isSelect = false;
  int selectedAmountIndex = -1;

  void updateAmount(String amount, int index) {
    amountController.text = amount;
    selectedAmountIndex = index;
    update();
  }
}
