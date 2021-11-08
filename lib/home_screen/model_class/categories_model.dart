class CategoriesModel {
  late String id, image, title;

  CategoriesModel({required this.id, required this.image, required this.title});

  CategoriesModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    image = map['img'];
    title = map['title'];
  }
}
