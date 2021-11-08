class BannerDataModel {
  late String image;

  BannerDataModel({required this.image});

  BannerDataModel.fromJson(Map<String, dynamic> map) {
    image = map['img'];
  }
}
