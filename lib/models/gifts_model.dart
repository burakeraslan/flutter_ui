class GiftsModel {
  final String title;
  final String image;
  final String cashback;
  bool isSelect;

  GiftsModel({
    required this.title,
    required this.image,
    required this.cashback,
    this.isSelect = false,
  });
}
