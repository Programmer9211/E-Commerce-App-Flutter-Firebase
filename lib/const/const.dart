import 'package:fluttertoast/fluttertoast.dart';

void showAlert(String msg) {
  Fluttertoast.showToast(msg: msg);
}

const String image =
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-72247.appspot.com/o/195-1950216_led-tv-png-hd-transparent-png.png?alt=media&token=0f8a6dac-1129-4b76-8482-47a6dcc0cd3e';

const String description = '''
Resolution: HD Ready 1366 x 768 Pixels
Model Id: 24TM2490
HDMI & USB: 2 & 2
Table Mount: No
Special Features: Impressive Picture Quality, Immersive Sound, Work From Home
Appliances that are pre-owned, refurbished, and open-box. all products are inspected and tested by our quality team. Our products have gone through a full diagnostic test, replacement of any faulty parts, and thorough cleaning. You may find minimal dents or scratches that will not impact the product's performance.
''';

// HomeScreen UI data -->

List<Categories> images = [
  Categories(
    img:
        "https://firebasestorage.googleapis.com/v0/b/e-commerce-72247.appspot.com/o/195-1950216_led-tv-png-hd-transparent-png.png?alt=media&token=0f8a6dac-1129-4b76-8482-47a6dcc0cd3e",
    title: "Electronics",
  ),
  Categories(
    img:
        "https://firebasestorage.googleapis.com/v0/b/e-commerce-72247.appspot.com/o/outfits%2Fshirt%201.jpg?alt=media&token=97a00773-f937-4517-a397-ee2fee536bc1",
    title: "Outfits",
  ),
  Categories(
    img:
        "https://firebasestorage.googleapis.com/v0/b/e-commerce-72247.appspot.com/o/groceries%2Fghee.png?alt=media&token=f190b7f5-8e70-4dbf-85d0-ba49c3661af5",
    title: "Groceries",
  ),
  Categories(
    img:
        "https://firebasestorage.googleapis.com/v0/b/e-commerce-72247.appspot.com/o/vegetables%2FTomato_je.jpg?alt=media&token=b66b71bc-d850-4119-8c98-c6d3fbd5486e",
    title: "Vegetable",
  ),
];

class Categories {
  late String img, title;

  Categories({required this.img, required this.title});
}
