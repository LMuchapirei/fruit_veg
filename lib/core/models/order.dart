import 'dart:math';

import 'package:fruit_veg/core/models/UserModel.dart';
import 'package:fruit_veg/core/models/user_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart';

import './Product.dart';

// to be set somewhere else
const shippingRate = 5;
const VAT = 15.0;

class Order {
  final UserModel owner;
  final List<Product> product;
  final DateTime dateCreated;
  bool delivered = false;
  DateTime datePaid = DateTime.now();
  bool paid = false;
  final String invoiceCode;
  String paymentCode;
  final DateTime expectedDeliverydate;
  final int saleNumber;
  final int itemsCount;
  final double itemsCost;
  final bool gotIssues = false;
  List<String> issues = [];
  double orderWeight = 0.0;

  double get totalCost =>
      (itemsCost + product[0].itemWeight * itemsCount * shippingRate) *
      ((100 + VAT) / 100);

  Order(
      {required this.owner,
      required this.saleNumber,
      required this.itemsCount,
      required this.datePaid,
      required this.product,
      required this.dateCreated,
      required this.expectedDeliverydate,
      required this.delivered,
      required this.paid,
      required this.invoiceCode,
      required this.paymentCode})
      : itemsCost = itemsCount * product.length * product[0].price,
        issues = [];
  operator ==(other) =>
      (other is Order) &&
      (product == other.product) &&
      (dateCreated == other.dateCreated) &&
      (saleNumber == other.saleNumber) &&
      (invoiceCode == other.invoiceCode);

  int get hashCode =>
      product.hashCode ^
      dateCreated.hashCode ^
      invoiceCode.hashCode ^
      paid.hashCode ^
      saleNumber.hashCode;

  @override
  String toString() {
    return "Paid-$paid Shipping date$expectedDeliverydate Created on $dateCreated Delivered -$delivered itemscount-$itemsCount ";
  }
}

final tempOrders = <Order>[
  Order(
      owner: UserModel(
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
          region: "Harare"),
      dateCreated: DateTime(2019, 8, 17, 12, 34),
      datePaid: DateTime(2019, 8, 14, 12, 36),
      delivered: false,
      expectedDeliverydate: DateTime(2019, 8, 21, 9, 10),
      invoiceCode: 'REWJNBGAJILLWPOJWJIU',
      paid: true,
      paymentCode: 'RRFFWR19200390',
      product: myList[7],
      saleNumber: Random().nextInt(1000),
      itemsCount: 3),
  Order(
      owner: UserModel(
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
          region: "Harare"),
      dateCreated: DateTime(2019, 8, 17, 12, 34),
      datePaid: DateTime(2019, 8, 14, 12, 36),
      delivered: false,
      expectedDeliverydate: DateTime(2019, 8, 21, 9, 10),
      invoiceCode: 'REWJNBGAJILLWPOJWJIU',
      paid: true,
      paymentCode: 'RRFFWR19200390',
      product: myList[4],
      saleNumber: Random().nextInt(1000),
      itemsCount: 2),
  Order(
      owner: UserModel(
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
          region: "Harare"),
      dateCreated: DateTime(2019, 8, 17, 12, 34),
      datePaid: DateTime(2019, 8, 14, 12, 36),
      delivered: true,
      expectedDeliverydate: DateTime(2019, 8, 21, 9, 10),
      invoiceCode: 'REWJNBGAJILLWPOJWJIU',
      paid: true,
      paymentCode: 'RRFFWR19200390',
      product: myList[3],
      saleNumber: Random().nextInt(1000),
      itemsCount: 1),
  Order(
      owner: UserModel(
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
          region: "Harare"),
      dateCreated: DateTime(2019, 8, 17, 12, 34),
      datePaid: DateTime(2019, 8, 14, 12, 36),
      delivered: false,
      expectedDeliverydate: DateTime(2019, 8, 21, 9, 10),
      invoiceCode: 'REWJNBGAJILLWPOJWJIU',
      paid: true,
      paymentCode: 'RRFFWR19200390',
      product: myList[Random().nextInt(myList.length)],
      saleNumber: Random().nextInt(1000),
      itemsCount: 2),
  Order(
      owner: UserModel(
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
          region: "Harare"),
      dateCreated: DateTime(2019, 8, 17, 12, 34),
      datePaid: DateTime(2019, 8, 14, 12, 36),
      delivered: false,
      expectedDeliverydate: DateTime(2019, 8, 21, 9, 10),
      invoiceCode: 'REWJNBGAJILLWPOJWJIU',
      paid: false,
      paymentCode: 'RRFFWR19200390',
      product: myList[2],
      saleNumber: Random().nextInt(1000),
      itemsCount: 1),
];
