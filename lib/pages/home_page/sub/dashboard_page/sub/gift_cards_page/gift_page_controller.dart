import 'package:flutter_ui/models/gifts_model.dart';
import 'package:get/get.dart';

class GiftPageController extends GetxController {
  List<GiftsModel> gifts = [
    GiftsModel(
      title: 'Eid',
      image: 'assets/images/eid.png',
      cashback: '10%',
    ),
    GiftsModel(
      title: 'Birthday',
      image: 'assets/images/birthday.png',
      cashback: '20%',
    ),
    GiftsModel(
      title: 'Marriage',
      image: 'assets/images/marriage.png',
      cashback: '10%',
    ),
  ];
}
