import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';

class AppData extends ChangeNotifier {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/shooe_tilt_1.png',
        category: "Trending Now",
        description:
            "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey."),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isSelected: false,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now",
        description:
            "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey."),
    Product(
        id: 3,
        name: 'Nike Air Max 98',
        isSelected: false,
        price: 220.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now",
        description:
            "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey."),
    Product(
        id: 4,
        name: 'Nike Air Max 99',
        price: 220.00,
        isSelected: false,
        isliked: false,
        image: 'assets/small_tilt_shoe_3.png',
        category: "Trending Now",
        description:
            "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey."),
  ];
  List<Product> cartList = [];
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/shoe_thumb_2.png',
        isSelected: true),
    Category(
        id: 2, name: "Jacket", isSelected: false, image: 'assets/jacket.png'),
    Category(
        id: 3, name: "Watch", isSelected: false, image: 'assets/watch.png'),
    Category(
        id: 4, name: "Watch", isSelected: false, image: 'assets/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];

  void addToCart(Product product) {
    cartList.add(product);
    print("${product.name} added");
    notifyListeners();
  }

  int get cartLength {
    return cartList.length;
  }

  UnmodifiableListView<Product> getProducts() {
    return UnmodifiableListView(productList);
  }

//  void selectCategory(Category category) {
//    for (int i = 0; i < categoryList.length; i++) {
//      Category c = categoryList[i];
//      if (category.id == c.id) {
//        if (category.isSelected = true) {
//          return;
//        }
//        category.isSelected = !c.isSelected;
//        notifyListeners();
//      } else {
//        c.isSelected = false;
//        notifyListeners();
//      }
//    }
//  }

  bool isCategorySelected(Category category) {
    return category.isSelected;
  }

  bool isProductSelected(Product category) {
    return category.isSelected;
  }

  bool isProductLiked(Product category) {
    return category.isliked;
  }

  void selectCategory(Category category) {
    categoryList.forEach((element) {
      if (element.id == category.id) {
        category.isSelected = true;
      } else
        element.isSelected = false;
    });
    notifyListeners();
  }

  void selectProduct(Product category) {
    productList.forEach((element) {
      if (element.id == category.id) {
        category.isSelected = true;
      } else
        element.isSelected = false;
    });
    notifyListeners();
  }

  void likeProduct(Product category) {
    productList.forEach((element) {
      if (element.id == category.id) {
        category.isliked = !category.isliked;
      }
    });
    notifyListeners();
  }
}
