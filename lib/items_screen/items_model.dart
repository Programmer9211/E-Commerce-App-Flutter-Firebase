class ItemsModel {
  late String id, image, title, detailId;

  late int totalPrice, sellingPrice;

  ItemsModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.detailId,
      required this.sellingPrice,
      required this.totalPrice});

  ItemsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['img'];
    detailId = map['details_id'] ?? "";
    title = map['title'];
    sellingPrice = map['sell_price'];
    totalPrice = map['total_price'];
  }
}
