class MyOrdersModel {
  late String image, name, orderId;
  late String orderOn, deliverON;
  late int totalPrice, paidAmount, status;

  MyOrdersModel(
      {required this.totalPrice,
      required this.orderId,
      required this.name,
      required this.deliverON,
      required this.image,
      required this.orderOn,
      required this.paidAmount,
      required this.status});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
    orderOn = json['oder_on'].toString();
    deliverON = json['deliver_on'].toString();
    status = json['status'];
    paidAmount = json['paid_amount'];
    name = json['name'];
    image = json['img'];
    orderId = json['orderId'];
  }
}
