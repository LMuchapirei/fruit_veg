import 'dart:collection';
import 'package:dashcast/core/models/Product.dart';
import 'package:flutter/material.dart';





class WishListNotifier extends ChangeNotifier{
   List<Product> _products=[];
   List<FruitProduct> _fruitProducts=[];
   List<UnitProductFruit> _unitProductFruits=[];
   List<UnitProductVegetable> _unitProductVegetables=[];

   void addProduct(Product product){ 
    _products.add(product);

      notifyListeners();
   }

   void addFruitProduct(FruitProduct fruitProduct){
    _fruitProducts.add(fruitProduct);  

      notifyListeners();
   }

  void addUnitProductVegetable(UnitProductVegetable unitProductVegetable){
    _unitProductVegetables.add(unitProductVegetable);
    notifyListeners();
  }
    void addUnitProductFruit(UnitProductFruit unitProductFruit){
    _unitProductFruits.add(unitProductFruit);
    notifyListeners();
  }

   bool removeProduct(Product product){
      // check if product exists
    bool exists=_products.contains(product);
    // handle if exists
    if(exists){
          _products.remove(product);
          // update model to include the selected weight
          notifyListeners();
    }
    
    return exists;
   }
   bool removeFruitProduct(FruitProduct fruitProduct){
     bool exists=_fruitProducts.contains(fruitProduct);
    if(exists){
    
      notifyListeners();
    }
    return exists;
   }

  bool removeUnitFruitProduct(UnitProductFruit unitProductFruit){
    bool exists=_unitProductFruits.contains(unitProductFruit);
    if(exists){
      _unitProductFruits.remove(unitProductFruit);
      notifyListeners();
    }
    return exists;
  }

  bool removeUnitVegetableProduct(UnitProductVegetable unitProductVegetable){
    bool exists=_unitProductVegetables.contains(unitProductVegetable);
    if(exists){
      _unitProductVegetables.remove(unitProductVegetable);
      notifyListeners();
    }
    return exists;
  }
  
  //  method to test the notifier
   void intialiseProducts(){
      //  myList..take(7).toList().forEach((element) {
      //    _products.add(element);
      //  });
      //  fruitProducts..take(5).toList().forEach((element) {
      //    _fruitProducts.add(element);
      //  });

      //  notifyListeners();
   }
   UnmodifiableListView<Product> get productsWishList=>UnmodifiableListView<Product>(_products);
   UnmodifiableListView<FruitProduct> get fruitProductsWishList=>UnmodifiableListView<FruitProduct>(_fruitProducts);
   UnmodifiableListView<UnitProductVegetable> get unitProductVegetables=>UnmodifiableListView(_unitProductVegetables);
   UnmodifiableListView<UnitProductFruit> get unitProductFruits=>UnmodifiableListView(_unitProductFruits);
   int get itemsCount=>_unitProductFruits.length+_unitProductVegetables.length+_products.length+_fruitProducts.length;
   
}


