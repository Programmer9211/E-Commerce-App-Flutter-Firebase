import 'package:fluttertoast/fluttertoast.dart';

void showAlert(String msg) {
  Fluttertoast.showToast(msg: msg);
}

const String bannerImage =
    "https://img.freepik.com/free-vector/interface-online-shopping-mobile-applications-websites-concepts_131114-29.jpg?size=626&ext=jpg";

const List<Categroies> images = [
  Categroies(
    imageUrl:
        "https://png.pngitem.com/pimgs/s/195-1950216_led-tv-png-hd-transparent-png.png",
    title: "Electronics",
  ),
  Categroies(
    imageUrl: "https://m.media-amazon.com/images/I/71PVpT4xAOL._AC_UL320_.jpg",
    title: "Outfits",
  ),
  Categroies(
    imageUrl:
        "https://www.pngitem.com/pimgs/m/553-5532693_single-grocery-items-hd-png-download.png",
    title: "Groceries",
  ),
  Categroies(
    imageUrl:
        "https://5.imimg.com/data5/IR/QZ/ST/ANDROID-90279950/product-jpeg-500x500.jpg",
    title: "Vegitables",
  ),
];

class Categroies {
  final String title, imageUrl;

  const Categroies({required this.imageUrl, required this.title});
}
