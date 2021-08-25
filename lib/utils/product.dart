
import 'package:flutter/cupertino.dart';

import 'any_image.dart';

class Product {
  int productId;
  String productName;
  //List<Category> categories;
  List<AnyImage> images;
  //List<Color> productColors;
  List<ColorSwatch> productColors;
  String categories;
  List<String> size;
  String shortDescription;
  String regularPrice;
  String salePrice;
  int discount;
  bool ifItemAvailable;
  bool ifAddedToCart;
  String description;
  int stockQuantity;
  int quantity;
  String seller;

  Product(
      {this.productId,
        this.productName,
        this.categories,
        this.images,
        this.productColors,
        this.size,
        this.shortDescription,
        this.regularPrice,
        this.salePrice,
        this.discount,
        this.ifItemAvailable,
        this.ifAddedToCart,
        this.description,
        this.stockQuantity,
        this.quantity,
        this.seller
      });

  @override
  toString() => "productId: $productId , productName: $productName";

}