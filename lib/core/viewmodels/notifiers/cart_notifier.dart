import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart';

const TAX_RATE = 0.145;

class CartNotifier extends ChangeNotifier {
  double _totalCost = 0.0;
  double _totalTax = 0.0;
  double _subTotal = 0.0;
  double taxRate = 14.5;
  int _itemsCount = 0;
  List<Product> _products = [];
  List<FruitProduct> _fruitProducts = [];
  List<UnitProductFruit> _unitProductFruits = [];
  List<UnitProductVegetable> _unitProductVegetables = [];
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
  UnmodifiableListView<FruitProduct> get fruitProducts =>
      UnmodifiableListView(_fruitProducts);
  UnmodifiableListView<UnitProductVegetable> get unitProductVegetables =>
      UnmodifiableListView(_unitProductVegetables);
  UnmodifiableListView<UnitProductFruit> get unitProductFruits =>
      UnmodifiableListView(_unitProductFruits);
  double get totalCost => _totalCost;
  double get totalTax => _totalTax;
  double get subTotal => _subTotal;
  int get itemsCount => _itemsCount;
  int currentUnitFruitCount(UnitProductFruit unitProductFruit) =>
      _unitProductFruits[getIndexOfUnitFruit(unitProductFruit)].quantity;
  int currentUnitVegeCount(UnitProductVegetable unitProductVegetable) =>
      _unitProductVegetables[getIndexOfUnitVegetable(unitProductVegetable)]
          .quantity;
  // get index of the product
  // get the quantity of the object
  //return this
  int getIndexOfUnitFruit(UnitProductFruit unitProductFruit) {
    var index = _unitProductFruits.indexWhere(
        (element) => equalityTesterUnitFruit(element, unitProductFruit));
    return index;
  }

  int getIndexOfUnitVegetable(UnitProductVegetable unitProductVegetable) {
    var index = _unitProductVegetables.indexWhere(
        (element) => equalityTesterUnitVeges(element, unitProductVegetable));
    return index;
  }

  bool removeProduct(Product product) {
    // check if  product exists
    bool exists = _products.contains(product);
    // handle if exists
    if (exists) {
      _products.remove(product);
      // update model to include the selected weight
      _totalCost = _totalCost - (product.costPerKilo * product.itemWeight);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      --_itemsCount;
      notifyListeners();
    }

    return exists;
  }

  bool removeFruit(FruitProduct fruitProduct) {
    bool exists = _fruitProducts.contains(fruitProduct);
    if (exists) {
      _fruitProducts.remove(fruitProduct);
      _totalCost =
          _totalCost - (fruitProduct.costPerKilo * fruitProduct.itemWeight);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      --_itemsCount;
      notifyListeners();
    }
    return exists;
  }

  bool removeUnitFruit(UnitProductFruit unitProductFruit) {
    bool exists = _unitProductFruits.contains(unitProductFruit);
    if (exists) {
      _unitProductFruits.remove(unitProductFruit);
      _totalCost =
          _totalCost - (unitProductFruit.unitCost * unitProductFruit.quantity);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      --_itemsCount;
      notifyListeners();
    }
    return exists;
  }

  bool removeUnitVegetable(UnitProductVegetable unitProductVegetable) {
    bool exists = _unitProductVegetables.contains(unitProductVegetable);
    if (exists) {
      _unitProductFruits.remove(unitProductVegetable);
      _totalCost = _totalCost -
          (unitProductVegetable.unitCost * unitProductVegetable.quantity);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      --_itemsCount;
      notifyListeners();
    }
    return exists;
  }

  void addProduct(Product product) {
    print("Adding item with selected weight as ${product.itemWeight}");
    _products.add(
        product); //somehow if its the same product we will have to increment ut issue of weights
    _totalCost = _totalCost + (product.costPerKilo * product.itemWeight);
    _totalTax = _totalCost * TAX_RATE;
    _subTotal = _totalTax + _totalCost;
    ++_itemsCount;
    notifyListeners();
  }

  void addUnitFruitProduct(UnitProductFruit unitProductFruit) {
    //process  find if product is in
    //if in increment the quantity
    //not in add it for the first time
    bool exists = false;
    _unitProductFruits.forEach((element) {
      if (equalityTesterUnitFruit(element, unitProductFruit)) {
        exists = true;
      }
    });
    if (exists) {
      var index = _unitProductFruits.indexWhere(
          (element) => equalityTesterUnitFruit(element, unitProductFruit));
      print("The index of element $index");
      // TRY TO GET CURRENT QUANTITY
      print('Current quantity ${_unitProductFruits[index].quantity}');
      // increase quantity
      ++_unitProductFruits[index].quantity;
      print('after increment quantity ${_unitProductFruits[index].quantity}');
      // change the tax totals
      _totalCost = _totalCost + (unitProductFruit.unitCost * 1);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      notifyListeners();
    } else {
      // add for the first time
      _unitProductFruits.add(unitProductFruit);
      ++_itemsCount;
      var index = _unitProductFruits.indexWhere(
          (element) => equalityTesterUnitFruit(element, unitProductFruit));
      ++_unitProductFruits[index].quantity;
      _totalCost = _totalCost + (unitProductFruit.unitCost * 1);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      notifyListeners();
    }
  }

  bool equalityTesterUnitFruit(UnitProductFruit p1, UnitProductFruit p2) {
    return p1.barCode == p2.barCode &&
        p1.description == p2.description &&
        p1.imagePath == p2.imagePath &&
        p1.leftInStock == p2.leftInStock &&
        p1.variety == p2.variety &&
        p1.name == p2.name &&
        p1.unitCost == p2.unitCost &&
        p1.rating == p2.rating &&
        p1.sales == p2.sales;
  }

  bool equalityTesterUnitVeges(
      UnitProductVegetable p1, UnitProductVegetable p2) {
    return p1.barCode == p2.barCode &&
        p1.description == p2.description &&
        p1.imagePath == p2.imagePath &&
        p1.leftInStock == p2.leftInStock &&
        p1.name == p2.name &&
        p1.unitCost == p2.unitCost &&
        p1.rating == p2.rating &&
        p1.sales == p2.sales;
  }

  void addUnitProductVegetable(UnitProductVegetable unitProductVegetable) {
    //process  find if product is in
    //if in increment the quantity
    //not in add it for the first time
    bool exists = false;
    _unitProductVegetables.forEach((element) {
      if (equalityTesterUnitVeges(element, unitProductVegetable)) {
        exists = true;
      }
    });
    if (exists) {
      var index = _unitProductVegetables.indexWhere(
          (element) => equalityTesterUnitVeges(element, unitProductVegetable));
      print("The index of element $index");
      // TRY TO GET CURRENT QUANTITY
      print('Current quantity ${_unitProductVegetables[index].quantity}');
      // increase quantity
      ++_unitProductVegetables[index].quantity;
      print(
          'after increment quantity ${_unitProductVegetables[index].quantity}');
      // change the tax totals
      _totalCost = _totalCost + (unitProductVegetable.unitCost * 1);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      notifyListeners();
    } else {
      // add for the first time
      _unitProductVegetables.add(unitProductVegetable);
      ++_itemsCount;
      var index = _unitProductVegetables.indexWhere(
          (element) => equalityTesterUnitVeges(element, unitProductVegetable));
      ++_unitProductVegetables[index].quantity;
      _totalCost = _totalCost + (unitProductVegetable.unitCost * 1);
      _totalTax = _totalCost * TAX_RATE;
      _subTotal = _totalTax + _totalCost;
      notifyListeners();
    }
  }

  void addFruitProduct(FruitProduct fruitProduct) {
    print("Adding item with selected weight as ${fruitProduct.itemWeight}");
    _fruitProducts.add(fruitProduct);
    _totalCost =
        _totalCost + (fruitProduct.itemWeight * fruitProduct.costPerKilo);
    _totalTax = _totalCost * TAX_RATE;
    _subTotal = _totalTax + _totalCost;
    ++_itemsCount;
    notifyListeners();
  }

  void changeProductWeight(FruitProduct fruitProduct, double weight) {
    if (_fruitProducts.contains(fruitProduct)) {
      // find index
      final index = _fruitProducts.indexOf(fruitProduct);
      // change its weight
      print("cureent total $totalCost");
      _fruitProducts[index].weight = weight;
      refreshCartValues();
      print("cureent total $totalCost");
      notifyListeners();
      print("cureent total $totalCost");
    }
  }

  void refreshCartValues() {
    double totalFruitsCost = 0.0;
    double totalProductCost = 0.0;
    _fruitProducts.forEach((element) {
      totalFruitsCost += element.itemCost;
    });
    _products.forEach((element) {
      totalProductCost += element.itemCost;
    });

    _totalCost = totalFruitsCost + totalProductCost;
    _totalTax = _totalCost * TAX_RATE;
    _subTotal = _totalTax + _totalCost;
    notifyListeners();
  }

  void checkOutHandler() {
    // handle Checkout
    // enumerate products and their types
    // get the total
    // and then call payment methods
    // persit changes to database
  }

  void productLoader() {
    for (var i = 0; i < 8; i++) {
      Random random = Random();
      var next = random.nextInt(recommendedProducts.length);
      _products.add(recommendedProducts[next]);
    }
    notifyListeners();
  }

  bool removeUnitProductFruit(UnitProductFruit fruitItem) {
    bool exists = containsUnitFruit(fruitItem);
    print("$exists test");
    if (exists) {
      var index = getIndexOfUnitFruit(fruitItem);
      print("${currentUnitFruitCount(fruitItem)} current quantity");
      if (_unitProductFruits[index].quantity > 0) {
        --_unitProductFruits[index].quantity;
        print(_totalCost);
        _totalCost = _totalCost - (_unitProductFruits[index].unitCost * 1);
        _totalTax = _totalCost * TAX_RATE;
        _subTotal = _totalTax + _totalCost;
        print(_totalCost);
        notifyListeners();
      } else {
        var removed = _unitProductFruits.removeAt(index);
        print(removed);
        --_itemsCount;
        notifyListeners();
      }
      exists = containsUnitFruit(fruitItem);
    }

    return exists;
  }

  bool removeUnitProductVeges(UnitProductVegetable vegetable) {
    bool exists = containsUnitVeges(vegetable);
    print("$exists test");
    if (exists) {
      var index = getIndexOfUnitVegetable(vegetable);

      if (_unitProductVegetables[index].quantity > 0) {
        --_unitProductVegetables[index].quantity;
        _totalCost = _totalCost - (_unitProductVegetables[index].unitCost * 1);
        _totalTax = _totalCost * TAX_RATE;
        _subTotal = _totalTax + _totalCost;
        notifyListeners();
      } else {
        var removed = _unitProductVegetables.removeAt(index);
        print(removed);
        --_itemsCount;
        notifyListeners();
      }
      exists = containsUnitVeges(vegetable);
    }

    return exists;
  }

  bool containsUnitFruit(UnitProductFruit fruitItem) {
    bool contained = false;
    _unitProductFruits.forEach((element) {
      if (equalityTesterUnitFruit(element, fruitItem)) {
        contained = true;
      }
    });
    return contained;
  }

  bool containsUnitVeges(UnitProductVegetable vegeItem) {
    bool contained = false;
    _unitProductVegetables.forEach((element) {
      if (equalityTesterUnitVeges(element, vegeItem)) {
        contained = true;
      }
    });
    return contained;
  }
}
