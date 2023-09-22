import 'package:flutter/material.dart';

class UserDataModel {
  final Color firstColor;
  final Color secondColor;
  final String balance;
  final String cent;
  final String cardNo;
  final String validFrom;
  final String validThru;
  final String cardHolder;

  UserDataModel({
    required this.firstColor,
    required this.secondColor,
    required this.balance,
    required this.cent,
    required this.cardNo,
    required this.validFrom,
    required this.validThru,
    required this.cardHolder,
  });
}
