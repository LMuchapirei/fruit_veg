import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';

//Number of tabs currently loading why?
class LoadingTabsCount extends ValueNotifier<int> {
  LoadingTabsCount() : super(0);
}

class ProductNotifier with ChangeNotifier {
  List<ProductCategory> _categories = [];
  final List<Product> _recommendedProducts = recommendedProducts;
  ProductNotifier(LoadingTabsCount loading) {
    _categories = [
      ProductCategory(
          productCategory: Variety.Leafy_Green, loadingTabsCount: loading),
      ProductCategory(
          productCategory: Variety.Cruciferous, loadingTabsCount: loading),
      ProductCategory(
          productCategory: Variety.Marrow, loadingTabsCount: loading),
      ProductCategory(
          productCategory: Variety.Allium, loadingTabsCount: loading),
      ProductCategory(productCategory: Variety.Stem, loadingTabsCount: loading),
      ProductCategory(productCategory: Variety.Root, loadingTabsCount: loading),
    ];
  }

  UnmodifiableListView<ProductCategory> get category =>
      UnmodifiableListView(_categories);
  UnmodifiableListView<Product> get allProducts =>
      UnmodifiableListView(_categories
          .expand((element) => element.products)
          .toSet()
          .toList(growable: false));
  UnmodifiableListView<Product> get recommendedProduct =>
      UnmodifiableListView(_recommendedProducts);
  // TODO :find way to connect to a backend and use streams for eventful data then normal for other data THIS IS AN INVALID STREAM
  ///[SAYING BAD STATE STREAM ALREADY BEEN USED] like in  java once a stream is used it cant be reused
  Stream<List<Product>> _flashProducts =
      Stream<List<Product>>.periodic(Duration(seconds: 2), getProductLikeHttpS)
          .asBroadcastStream();
  Stream<List<Product>> get flashProducts => _flashProducts;
}

class ProductCategory with ChangeNotifier {
  final Variety productCategory;
  // List<Product> _products=myList;
  List<Product> _products = [];
  ProductCategory(
      {required this.productCategory, required this.loadingTabsCount});
  bool _isloading = false;
  bool get isLoading => _isloading;
  final LoadingTabsCount loadingTabsCount;
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  Future<void> refresh() async {
    // simulate a fetch to an external API
    _isloading = true;
    notifyListeners();
    loadingTabsCount.value += 1;
    var product = await Future<Product>.delayed(
        (Duration(seconds: 1)), getProductLikeHttp);
    // add product to current tab if the product matches the category
    if (product.variety == productCategory) {
      // make sure the product is not already in the tabs
      if (!_products.contains(product)) _products.add(product);
    }
    _isloading = false;
    notifyListeners();
    loadingTabsCount.value -= 1;
  }
}

List<Product> getProductLikeHttpS(int event) {
  Random rand = Random();

  var list = <Product>[];
  for (int i = 0; i < 5; i++) {
    list.add(myList[rand.nextInt(myList.length)]);
  }
  return list;
}

List<Product> getProductsByBrand(String brandName) {
  return <Product>[];
}

Product getProductLikeHttp() {
  Random rand = Random();
  var index = rand.nextInt(myList.length);
  return myList[index];
}

List<Product> recommendedProducts = [
//       Product(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cabbage",
//           variety: Variety.Cruciferous,
//           price: 899.99,
//           sales: 123,
//           leftInStock: 56,
//           rating: 4.4, brand: '',
//           costPerKilo: null),
//     Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         rating: 4.4),
//         Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Potatoes",
//         variety: Variety.Root,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         rating: 4.4),
//         Product(
//         barCode: "908r47",
//         imagePath: "assets/images/office.jpg",
//         name: "Final Cut pro",
//         variety: Variety.Marrow,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         rating: 4.4),
];
final List<Product> myList = [
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: Variety.Cruciferous,
//         costPerKilo: 1.87,
//         price: 899.99,
//         discount: 10.8,
//         sales: 123,
//         leftInStock: 56,
//         maxWeight: 10,
//         brand: 'One plus',
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: Variety.Cruciferous,
//         price: 399.99,
//         costPerKilo: 3.87,
//         sales: 123,
//         discount: 10.8,
//         leftInStock: 34,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         discount: 10.9,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         rating: 4.4),
//       Product(
//           barCode: "908247",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cabbage",
//           variety: Variety.Cruciferous,
//           price: 899.99,
//           brand: 'one plus',
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.84,
//           maxWeight: 10,
//           discount: 12.3,
//           rating: 4.4),
//     Product(
//         barCode: "908447",
//         imagePath: "assets/images/office.jpg",
//         name: "Lettuce",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 0,
//         brand: "Dell",
//         maxWeight: 10,
//         rating: 4.4),

//         Product(
//         barCode: "908147",
//         imagePath: "assets/images/office.jpg",
//         name: "Cabbage",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 0,
//         brand: "Dell coorp",
//         maxWeight: 10,
//         rating: 4.4),
//         Product(
//         barCode: "908r47",
//         imagePath: "assets/images/office.jpg",
//         name: "Onion",
//         variety: Variety.Allium,
//         price: 899.99,
//         costPerKilo: 1.87,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Adobe Coorperation",
//         discount: 9.8,
//         maxWeight: 10,
//         rating: 4.4),
//         Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: Variety.Allium,
//         price: 899.99,
//         sales: 123,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 0,
//         brand: 'One plus',
//         leftInStock: 56,
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: Variety.Cruciferous,
//         price: 399.99,
//         sales: 123,
//         leftInStock: 34,
//         discount: 7.8,
//         maxWeight: 10,
//         brand: "Apple",
//         costPerKilo: 3.7,
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 24.0,
//         brand: "Apple",
//         maxWeight: 10,
//         rating: 4.4),

//       Product(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Broccoli",
//           variety: Variety.Cruciferous,
//           price: 899.99,
//           sales: 123,
//           brand: 'One plus',
//           discount: 7,
//           costPerKilo: 1.87,
//           maxWeight: 10,
//           leftInStock: 56,
//           rating: 4.4),
//     Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 0,
//         rating: 4.4),
//         Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Sweet Potato",
//         variety: Variety.Root,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         discount: 9,
//         maxWeight: 10,
//         rating: 4.4),
//         Product(
//         barCode: "908r47",
//         imagePath: "assets/images/office.jpg",
//         name: "Final Cut pro",
//         variety: Variety.Allium,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 12,
//         brand: "Apple",
//         maxWeight: 10,
//         rating: 4.4),
//         Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: Variety.Cruciferous,
//         price: 899.99,
//         sales: 123,
//         costPerKilo: 1.87,
//         leftInStock: 56,
//         maxWeight: 10,
//         discount: 3,
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: Variety.Cruciferous,
//         price: 399.99,
//         sales: 123,
//         discount: 2,
//         leftInStock: 34,
//         maxWeight: 10,
//         costPerKilo: 1.7,
//         brand: "Apple",
//         rating: 4.4),
//     Product(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: Variety.Leafy_Green,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 4.87,
//         discount: 1,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),

//       Product(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cauliflower",
//           variety: Variety.Cruciferous,
//           price: 899.99,
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.87,
//           discount: 1,
//           maxWeight: 10,
//           rating: 4.4),
//     Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Lettuce",
//         variety: Variety.Leafy_Green,
//         price: 12899.99,
//         sales: 123,
//         discount: 1,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),
//         Product(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Potatoes",
//         variety: Variety.Root,
//         price: 899.99,
//         sales: 700,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 1,
//         brand: "Apple",
//         rating: 4.4),
//         Product(
//         barCode: "908r4712",
//         imagePath: "assets/images/office.jpg",
//         name: "Garlic",
//         variety: Variety.Allium,
//         maxWeight: 10,
//         price: 899.99,
//         discount: 1,
//         costPerKilo: 1.87,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Sketch",
//         rating: 4.4),
//          Product(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cauliflower",
//           variety: Variety.Cruciferous,
//           price: 899.99,
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.87,
//           discount: 1,
//           maxWeight: 10,
//           rating: 4.4),
];

List<FruitProduct> fruitProducts = [
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: FruitVariety.Citrus,
//         costPerKilo: 1.87,
//         price: 899.99,
//         discount: 10.8,
//         sales: 123,
//         leftInStock: 56,
//         maxWeight: 10,
//         brand: 'One plus',
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: FruitVariety.Melons,
//         price: 399.99,
//         costPerKilo: 3.87,
//         sales: 123,
//         discount: 10.8,
//         leftInStock: 34,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: FruitVariety.Stone_Fruit,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         discount: 10.9,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         rating: 4.4),
//       FruitProduct(
//           barCode: "908247",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cabbage",
//           variety: FruitVariety.Miscelaneous,
//           price: 899.99,
//           brand: 'one plus',
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.84,
//           maxWeight: 10,
//           discount: 12.3,
//           rating: 4.4),
//     FruitProduct(
//         barCode: "908447",
//         imagePath: "assets/images/office.jpg",
//         name: "Lettuce",
//         variety: FruitVariety.Miscelaneous,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 0,
//         brand: "Dell",
//         maxWeight: 10,
//         rating: 4.4),

//         FruitProduct(
//         barCode: "908147",
//         imagePath: "assets/images/office.jpg",
//         name: "Cabbage",
//         variety: FruitVariety.Miscelaneous,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 0,
//         brand: "Dell coorp",
//         maxWeight: 10,
//         rating: 4.4),
//         FruitProduct(
//         barCode: "908r47",
//         imagePath: "assets/images/office.jpg",
//         name: "Onion",
//         variety: FruitVariety.Miscelaneous,
//         price: 899.99,
//         costPerKilo: 1.87,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Adobe Coorperation",
//         discount: 9.8,
//         maxWeight: 10,
//         rating: 4.4),
//         FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: FruitVariety.Melons,
//         price: 899.99,
//         sales: 123,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 0,
//         brand: 'One plus',
//         leftInStock: 56,
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: FruitVariety.Melons,
//         price: 399.99,
//         sales: 123,
//         leftInStock: 34,
//         discount: 7.8,
//         maxWeight: 10,
//         brand: "Apple",
//         costPerKilo: 3.7,
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: FruitVariety.Tropical,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 24.0,
//         brand: "Apple",
//         maxWeight: 10,
//         rating: 4.4),

//       FruitProduct(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Broccoli",
//           variety: FruitVariety.Tropical,
//           price: 899.99,
//           sales: 123,
//           brand: 'One plus',
//           discount: 7,
//           costPerKilo: 1.87,
//           maxWeight: 10,
//           leftInStock: 56,
//           rating: 4.4),
//     FruitProduct(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: FruitVariety.Citrus,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 0,
//         rating: 4.4),
//         FruitProduct(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Sweet Potato",
//         variety: FruitVariety.Citrus,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Apple",
//         costPerKilo: 1.87,
//         discount: 9,
//         maxWeight: 10,
//         rating: 4.4),
//         FruitProduct(
//         barCode: "908r47",
//         imagePath: "assets/images/office.jpg",
//         name: "Final Cut pro",
//         variety: FruitVariety.Citrus,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         discount: 12,
//         brand: "Apple",
//         maxWeight: 10,
//         rating: 4.4),
//         FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cabbage",
//         variety: FruitVariety.Citrus,
//         price: 899.99,
//         sales: 123,
//         costPerKilo: 1.87,
//         leftInStock: 56,
//         maxWeight: 10,
//         discount: 3,
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/blueberries.jpg",
//         name: "Cauliflower",
//         variety: FruitVariety.Citrus,
//         price: 399.99,
//         sales: 123,
//         discount: 2,
//         leftInStock: 34,
//         maxWeight: 10,
//         costPerKilo: 1.7,
//         brand: "Apple",
//         rating: 4.4),
//     FruitProduct(
//         barCode: "9087",
//         imagePath: "assets/images/office.jpg",
//         name: "Spinach",
//         variety: FruitVariety.Melons,
//         price: 899.99,
//         sales: 123,
//         leftInStock: 12,
//         costPerKilo: 4.87,
//         discount: 1,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),

//       FruitProduct(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cauliflower",
//           variety: FruitVariety.Stone_Fruit,
//           price: 899.99,
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.87,
//           discount: 1,
//           maxWeight: 10,
//           rating: 4.4),
//     FruitProduct(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Lettuce",
//         variety: FruitVariety.Berries,
//         price: 12899.99,
//         sales: 123,
//         discount: 1,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         brand: "Apple",
//         rating: 4.4),
//         FruitProduct(
//         barCode: "90847",
//         imagePath: "assets/images/office.jpg",
//         name: "Potatoes",
//         variety: FruitVariety.Berries,
//         price: 899.99,
//         sales: 700,
//         leftInStock: 12,
//         costPerKilo: 1.87,
//         maxWeight: 10,
//         discount: 1,
//         brand: "Apple",
//         rating: 4.4),
//         FruitProduct(
//         barCode: "908r4712",
//         imagePath: "assets/images/office.jpg",
//         name: "Garlic",
//         variety: FruitVariety.Citrus,
//         maxWeight: 10,
//         price: 899.99,
//         discount: 1,
//         costPerKilo: 1.87,
//         sales: 123,
//         leftInStock: 12,
//         brand: "Sketch",
//         rating: 4.4),
//          FruitProduct(
//           barCode: "90847",
//           imagePath: "assets/images/blueberries.jpg",
//           name: "Cauliflower",
//           variety: FruitVariety.Berries,
//           price: 899.99,
//           sales: 123,
//           leftInStock: 56,
//           costPerKilo: 1.87,
//           discount: 1,
//           maxWeight: 10,
//           rating: 4.4),
];
