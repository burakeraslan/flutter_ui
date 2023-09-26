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

  RxInt? amount;
  Rx<Color> color100 = const Color(0x30A4A9AE).obs;
  Rx<Color> color150 = const Color(0x30A4A9AE).obs;
  Rx<Color> color200 = const Color(0x30A4A9AE).obs;

  void updateAmount100() {
    amount = 100.obs;
    color100 = const Color(0xFFFFFFFF).obs;
    color150 = const Color(0x30A4A9AE).obs;
    color200 = const Color(0x30A4A9AE).obs;
    update();
  }

  void updateAmount150() {
    amount = 150.obs;
    color100 = const Color(0x30A4A9AE).obs;
    color150 = const Color(0xFFFFFFFF).obs;
    color200 = const Color(0x30A4A9AE).obs;
    update();
  }

  void updateAmount200() {
    amount = 200.obs;
    color100 = const Color(0x30A4A9AE).obs;
    color150 = const Color(0x30A4A9AE).obs;
    color200 = const Color(0xFFFFFFFF).obs;
    update();
  }
}
