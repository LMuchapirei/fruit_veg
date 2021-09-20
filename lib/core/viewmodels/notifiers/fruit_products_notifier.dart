import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';

//Number of tabs currently loading why?
class FruitLoadingTabsCount extends ValueNotifier<int> {
  FruitLoadingTabsCount() : super(0);
}

class FruitProductNotifier with ChangeNotifier {
  List<FruitProductCategory> _categories = [];
  final List<FruitProduct> _recommendedFruits = [];
  FruitProductNotifier(FruitLoadingTabsCount loading) {
    _categories = [
      FruitProductCategory(
          fruitCategory: FruitVariety.Berries,
          categoryName: "Berries",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Citrus,
          categoryName: "Citrus",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Melons,
          categoryName: "Melons",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Miscelaneous,
          categoryName: "Tomatoes and Avocados",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Stone_Fruit,
          categoryName: "Stone Fruit",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Tropical,
          categoryName: "Tropical",
          loadingTabsCount: loading),
      FruitProductCategory(
          fruitCategory: FruitVariety.Apples,
          categoryName: "Apples",
          loadingTabsCount: loading),
    ];
  }

  UnmodifiableListView<FruitProductCategory> get category =>
      UnmodifiableListView(_categories);
  UnmodifiableListView<FruitProduct> get allFruits =>
      UnmodifiableListView(_categories
          .expand((element) => element.products)
          .toSet()
          .toList(growable: false));
  UnmodifiableListView<FruitProduct> get recommendedProduct =>
      UnmodifiableListView(_recommendedFruits);
  // TODO :find way to connect to a backend and use streams for eventful data then normal for other data THIS IS AN INVALID STREAM
  ///[sAYING BAD STATE STREAM ALREADY BEEN USED] like in  java once a stream is used it cant be reused
  Stream<List<FruitProduct>> _flashProducts =
      Stream<List<FruitProduct>>.periodic(
          Duration(seconds: 2), getProductLikeHttpS);
  Stream<List<FruitProduct>> get flashProducts => _flashProducts;
}

class FruitProductCategory with ChangeNotifier {
  final FruitVariety fruitCategory;
  final String categoryName;
  // List<Product> _products=myList;
  List<FruitProduct> _fruitProducts = [];
  FruitProductCategory(
      {required this.categoryName,
      required this.fruitCategory,
      required this.loadingTabsCount});
  bool _isloading = false;
  bool get isLoading => _isloading;
  final FruitLoadingTabsCount loadingTabsCount;
  UnmodifiableListView<FruitProduct> get products =>
      UnmodifiableListView(_fruitProducts);
  void intialiseProducts() {
    var productsForCategory = fruitProducts
        .where((product) => product.variety == fruitCategory)
        .toList();
    _fruitProducts.addAll(productsForCategory);
    notifyListeners();
  }

  Future<void> refresh() async {
    // simulate a fetch to an external API
    // _isloading=true;
    notifyListeners();
    // loadingTabsCount.value+=1;
    var product = await Future<FruitProduct>.delayed(
        (Duration(milliseconds: 100)), getProductLikeHttp);
    // var product=fruitProducts[Random().nextInt(fruitProducts.length)];
    // add product to current tab if the product matches the category
    if (product.variety == fruitCategory) {
      // make sure the product is not already in the tabs
      if (!_fruitProducts.contains(product)) _fruitProducts.add(product);
    }
    // _isloading=false;
    notifyListeners();
    // loadingTabsCount.value-=1;
  }

  void refreshCaller() {
    refresh();
  }
}

List<FruitProduct> getProductLikeHttpS(int event) {
  Random rand = Random();

  var list = <FruitProduct>[];
  for (int i = 0; i < 5; i++) {
    list.add(fruitProducts[rand.nextInt(fruitProducts.length)]);
  }
  return list;
}

List<Product> getProductsByBrand(String brandName) {
  return <Product>[];
}

FruitProduct getProductLikeHttp() {
  Random rand = Random();
  var index = rand.nextInt(fruitProducts.length);

  // const url='http://192.168.1.103:3000/graphql/';
  return fruitProducts[index];
}

class FruitData extends Equatable {
  final String categoryName;
  final FruitVariety variety;
  final String imagePath;

  FruitData(
      {required this.categoryName,
      required this.imagePath,
      required this.variety});

  @override
  List<Object> get props => [categoryName, imagePath];
}

List<FruitProduct> fruitProducts = [
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/fruits/oranges.jpg",
      name: "Oranges",
      variety: FruitVariety.Citrus,
      costPerKilo: 1.87,
      price: 899.99,
      discount: 10.8,
      sales: 123,
      leftInStock: 56,
      maxWeight: 10,
      brand: 'One plus',
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/fruits/melons.jpg",
      name: "WaterMelons",
      variety: FruitVariety.Melons,
      price: 399.99,
      costPerKilo: 3.87,
      sales: 123,
      discount: 10.8,
      leftInStock: 34,
      maxWeight: 10,
      brand: "Apple",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/fruits/peaches.jpg",
      name: "Peaches",
      variety: FruitVariety.Stone_Fruit,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      discount: 10.9,
      brand: "Apple",
      costPerKilo: 1.87,
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908247",
      imagePath: "assets/images/fruits/blueberries.jpg",
      name: "Cabbage",
      variety: FruitVariety.Miscelaneous,
      price: 899.99,
      brand: 'one plus',
      sales: 123,
      leftInStock: 56,
      costPerKilo: 1.84,
      maxWeight: 10,
      discount: 12.3,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908447",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Lettuce",
      variety: FruitVariety.Miscelaneous,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      costPerKilo: 1.87,
      discount: 0,
      brand: "Dell",
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908147",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Cabbage",
      variety: FruitVariety.Miscelaneous,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      costPerKilo: 1.87,
      discount: 0,
      brand: "Dell coorp",
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908r47",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Onion",
      variety: FruitVariety.Miscelaneous,
      price: 899.99,
      costPerKilo: 1.87,
      sales: 123,
      leftInStock: 12,
      brand: "Adobe Coorperation",
      discount: 9.8,
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/blueberries.jpg",
      name: "Cabbage",
      variety: FruitVariety.Melons,
      price: 899.99,
      sales: 123,
      costPerKilo: 1.87,
      maxWeight: 10,
      discount: 0,
      brand: 'One plus',
      leftInStock: 56,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/blueberries.jpg",
      name: "Cauliflower",
      variety: FruitVariety.Melons,
      price: 399.99,
      sales: 123,
      leftInStock: 34,
      discount: 7.8,
      maxWeight: 10,
      brand: "Apple",
      costPerKilo: 3.7,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Spinach",
      variety: FruitVariety.Tropical,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      costPerKilo: 1.87,
      discount: 24.0,
      brand: "Apple",
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/blueberries.jpg",
      name: "Broccoli",
      variety: FruitVariety.Tropical,
      price: 899.99,
      sales: 123,
      brand: 'One plus',
      discount: 7,
      costPerKilo: 1.87,
      maxWeight: 10,
      leftInStock: 56,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Spinach",
      variety: FruitVariety.Citrus,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      brand: "Apple",
      costPerKilo: 1.87,
      maxWeight: 10,
      discount: 0,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Sweet Potato",
      variety: FruitVariety.Citrus,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      brand: "Apple",
      costPerKilo: 1.87,
      discount: 9,
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908r47",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Final Cut pro",
      variety: FruitVariety.Citrus,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      costPerKilo: 1.87,
      discount: 12,
      brand: "Apple",
      maxWeight: 10,
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/blueberries.jpg",
      name: "Cabbage",
      variety: FruitVariety.Citrus,
      price: 899.99,
      sales: 123,
      costPerKilo: 1.87,
      leftInStock: 56,
      maxWeight: 10,
      discount: 3,
      rating: 4.4,
      brand: '',
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/blueberries.jpg",
      name: "Cauliflower",
      variety: FruitVariety.Citrus,
      price: 399.99,
      sales: 123,
      discount: 2,
      leftInStock: 34,
      maxWeight: 10,
      costPerKilo: 1.7,
      brand: "Apple",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "9087",
      imagePath: "assets/images/fruits/tomatoes.jpg",
      name: "Spinach",
      variety: FruitVariety.Melons,
      price: 899.99,
      sales: 123,
      leftInStock: 12,
      costPerKilo: 4.87,
      discount: 1,
      maxWeight: 10,
      brand: "Apple",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/blueberries.jpg",
      name: "Cauliflower",
      variety: FruitVariety.Stone_Fruit,
      price: 899.99,
      sales: 123,
      leftInStock: 56,
      costPerKilo: 1.87,
      discount: 1,
      maxWeight: 10,
      rating: 4.4,
      brand: '',
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/fruits/strawberry.jpg",
      name: "Strawberries",
      variety: FruitVariety.Berries,
      price: 12899.99,
      sales: 123,
      discount: 1,
      leftInStock: 12,
      costPerKilo: 1.87,
      maxWeight: 10,
      brand: "Apple",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/fruits/strawberry.jpg",
      name: "Strawberries",
      variety: FruitVariety.Berries,
      price: 899.99,
      sales: 700,
      leftInStock: 12,
      costPerKilo: 1.87,
      maxWeight: 10,
      discount: 1,
      brand: "Apple",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "908r4712",
      imagePath: "assets/images/fruits/oranges.jpg",
      name: "Lemons",
      variety: FruitVariety.Citrus,
      maxWeight: 10,
      price: 899.99,
      discount: 1,
      costPerKilo: 1.87,
      sales: 123,
      leftInStock: 12,
      brand: "Sketch",
      rating: 4.4,
      description: ''),
  FruitProduct(
      barCode: "90847",
      imagePath: "assets/images/fruits/blueberries.jpg",
      name: "Blueberries",
      variety: FruitVariety.Berries,
      price: 899.99,
      sales: 123,
      leftInStock: 56,
      costPerKilo: 1.87,
      discount: 1,
      maxWeight: 10,
      rating: 4.4,
      brand: '',
      description: ''),
];
