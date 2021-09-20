import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/models/brand_model.dart';
import 'package:fruit_veg/core/models/review_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart'
    show myList;

class BrandsNotifier extends ChangeNotifier {
  List<Brand> _brands = brands; //the magic line can we fetch this externally ok
  List<BrandNotifier> _brandNotifier = [];
  BrandsNotifier() {
    _brands = brands;
    _brands.forEach((element) {
      _brandNotifier.add(BrandNotifier(brand: element));
    });
  }

  UnmodifiableListView<Brand> get brandsGetter =>
      UnmodifiableListView<Brand>(_brands);
  UnmodifiableListView<BrandNotifier> get brandsProvider =>
      UnmodifiableListView<BrandNotifier>(_brandNotifier);
}

class BrandNotifier extends ChangeNotifier {
  final Brand brand;
  List<Product> _brandProducts =
      []; //service to get products for a particular brand and update their stock quantities
  List<UserReview> _reviews = [];
  BrandNotifier({required this.brand}) {
    initialiseProducts();
  }
  // service to get products
  void initialiseProducts() {
    var iter = myList
        .where((element) =>
            element.brand.toLowerCase().contains(brand.brandName.toLowerCase()))
        .toList();
    iter.forEach((element) {
      _brandProducts.add(element);
    });
  }

  // service to manage reviews
  void initialiseReviews() {
    // uses local dummy data
    var iter = reviews;
    iter.forEach((element) {
      _reviews.add(element);
    });
  }

  UnmodifiableListView<Product> get products =>
      UnmodifiableListView<Product>(_brandProducts);
  UnmodifiableListView<UserReview> get reviewsGetter =>
      UnmodifiableListView(_reviews);
}
