import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String imagePath;
  final String name;
  final Variety variety;
  final String brand;
  final double price; //average ordered price
  final String barCode;
  final int sales;
  final double maxWeight;
  final double discount;
  final String description;
  final double rating;
  final int leftInStock;
  final double costPerKilo;
  double _itemWeight;
  Product(
      {this.maxWeight,
      this.costPerKilo,
      this.leftInStock,
      this.brand = "Not Available",
      this.description = "Contact Seller",
      this.discount,
      @required this.imagePath,
      @required this.name,
      @required this.variety,
      @required this.price,
      @required this.barCode,
      @required this.sales,
      @required this.rating})
      : _itemWeight = 2;

  set weight(value) => _itemWeight = value;
  get itemCost => _itemWeight * costPerKilo;
  get itemWeight => _itemWeight;
  @override
  List<Object> get props => [
        imagePath,
        name,
        variety,
        brand,
        price,
        barCode,
        sales,
        maxWeight,
        discount,
        description,
        rating,
        leftInStock,
        costPerKilo,
        _itemWeight
      ];
  // operator ==(other)=>
  // (other is Product) &&(name==other.name)&&(price==other.price)&&(barCode==other.barCode);

  // int get hashCode=>name.hashCode^price.hashCode^barCode.hashCode;
}

// enum Variety{
//   Desktops_Notebooks,
//   Smartphones,
//   Components,
//   Software,
//   Other
// }

class FruitProduct extends Equatable {
  final String imagePath;
  final String name;
  final FruitVariety variety;
  final String brand;
  final double price;
  final String barCode;
  final int sales;
  final double maxWeight;
  final double discount;
  final String description;
  final double rating;
  final int leftInStock;
  final double costPerKilo;
  double _itemWeight;
  FruitProduct(
      {this.maxWeight,
      this.costPerKilo,
      this.leftInStock,
      this.brand = "Not Available",
      this.description = "Contact Seller",
      this.discount,
      @required this.imagePath,
      @required this.name,
      @required this.variety,
      @required this.price,
      @required this.barCode,
      @required this.sales,
      @required this.rating})
      : _itemWeight = 2;
  set weight(value) => _itemWeight = value;
  get itemCost => _itemWeight * costPerKilo;
  get itemWeight => _itemWeight;
  @override
  List<Object> get props => [
        imagePath,
        name,
        variety,
        brand,
        price,
        barCode,
        sales,
        maxWeight,
        discount,
        description,
        rating,
        leftInStock,
        costPerKilo,
        _itemWeight
      ];
}

class UnitProductFruit {
  final String imagePath;
  final String name;
  final FruitVariety variety;
  // final String brand;
  final String barCode;
  final int sales;
  final double discount;
  final String description;
  final double rating;
  final int leftInStock;
  final double unitCost;
  int quantity;

  UnitProductFruit(
      {this.imagePath,
      this.name,
      this.variety,
      // this.brand,
      this.barCode,
      this.sales,
      this.discount,
      this.description,
      this.rating,
      this.leftInStock,
      this.unitCost})
      : quantity = 0;
  operator ==(other) =>
      other is UnitProductFruit &&
      name == other.name &&
      imagePath == other.imagePath &&
      variety == other.variety &&
      barCode == other.barCode &&
      sales == other.sales &&
      discount == other.discount &&
      description == other.description &&
      rating == other.rating &&
      leftInStock == other.leftInStock &&
      quantity == other.quantity &&
      unitCost == other.unitCost;
  @override
  int get hashCode =>
      name.hashCode ^
      imagePath.hashCode ^
      variety.hashCode ^
      barCode.hashCode ^
      sales.hashCode ^
      discount.hashCode ^
      description.hashCode ^
      rating.hashCode ^
      leftInStock.hashCode ^
      quantity.hashCode ^
      unitCost.hashCode;
}

class UnitProductVegetable extends Equatable {
  final String imagePath;
  final String name;
  final Variety variety;
  final String barCode;
  final int sales;
  final double discount;
  final String description;
  final double rating;
  final int leftInStock;
  final double unitCost;
  int quantity;

  UnitProductVegetable(
      {this.imagePath,
      this.name,
      this.variety,
      this.barCode,
      this.sales,
      this.discount,
      this.description,
      this.rating,
      this.leftInStock,
      this.unitCost})
      : quantity = 0;
  @override
  // TODO: implement props
  List<Object> get props => [
        imagePath,
        name,
        variety,
        quantity,
        barCode,
        sales,
        discount,
        description,
        rating,
        leftInStock,
        unitCost,
      ];
}

enum Variety { Leafy_Green, Cruciferous, Marrow, Root, Stem, Allium }

enum FruitVariety {
  Citrus,
  Stone_Fruit,
  Tropical,
  Berries,
  Melons,
  Miscelaneous,
  Apples
}
