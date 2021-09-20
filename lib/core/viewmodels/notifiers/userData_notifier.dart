import 'package:dashcast/core/models/Product.dart';
import 'package:dashcast/core/models/UserModel.dart';
import 'package:dashcast/core/models/order.dart';
import 'package:dashcast/core/models/user_model.dart';
import 'package:flutter/material.dart';

class Userdata extends ChangeNotifier {
  UserModel _user;
  List<Order> _unpaid = [];
  List<Order> _toShip = [];
  List<Order> _shipped = [];
  List<Order> _issues = [];
  Userdata() {
    // get data from external server
    //populate the orders of the user from external server
    _user = UserModel(
        user: User(
            birthDate: "1997-06-23",
            emailAdress: "linvle2@gmail.com",
            fullName: "Linval Muchapirei",
            gender: Gender.Male),
        address1: "21 17th Crescent Warren Park",
        address2: "None",
        city: "Harare",
        company: "TechSons",
        country: "Zimbabwe",
        phoneNumber: "+263787452541",
        postCode: "0000",
        region: "Harare");
    myOrders = tempOrders;
    myOrders.forEach((element) {
      if(!element.paid){
        _unpaid.add(element);
      }
    });
    // myOrders.where((element) => element.delivered).toList().forEach((item) {
    //   print(item);
    //   _toShip.add(item);
    // });
    myOrders.forEach((element) {
      if(!element.delivered){
        _toShip.add(element);
      }
    });
    myOrders.where((element) => element.delivered).toList().forEach((item) {
      print(item);
      _shipped.add(item);
    });
    myOrders
        .where((element) => element.issues.isNotEmpty)
        .toList()
        .forEach((item) {
      print(item);
      _issues.add(item);
    });
  }
  List<Order> myOrders = <Order>[];
  
  // List<Order> get unpaid=>myOrders.where((element) => !element.paid).toList();
  // List<Order> get toShip=>myOrders.isEmpty?0:myOrders.where((element) => !element.delivered).toList();
  // List<Order> get shipped=>myOrders.isEmpty?0:myOrders.where((element)=>element.delivered).toList();
  // List<Order> get issues=>myOrders.isEmpty?0:myOrders.where((element) => element.issues.isNotEmpty).toList();

  List<Order> get unpaid => _unpaid;
  List<Order> get toShip => _toShip;
  List<Order> get shipped => _shipped;
  List<Order> get issues => _issues;
  UserModel get user => _user;
  Future<void> resetUser(User user) {
    notifyListeners();
    if (user != null) {
      _user.user = user;
      // change it in the api
      print(_user.user.birthDate +
          " " +
          _user.user.emailAdress +
          "  " +
          _user.user.genderGetter +
          " " +
          _user.user.birthDate);
    }
    notifyListeners();
    return Future.value();
  }

  Future<void> resetAddressData(AddressDetails addressDetails) {
    notifyListeners();
    if (addressDetails != null) {
      _user.address1 = addressDetails.address1;
      _user.address2 = addressDetails.address2;
      _user.city = addressDetails.city;
      _user.company = addressDetails.company;
      _user.country = addressDetails.country;
      _user.phoneNumber = '+263787452541';
      _user.postCode = addressDetails.postCode;
      _user.region = addressDetails.region;
    }
    notifyListeners();
    return Future.value();
  }

  List<Product> _wishList=[
    
  ];
  List<Product> get wishList=>_wishList;
}

