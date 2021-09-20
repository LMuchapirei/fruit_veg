import 'dart:math';

import 'package:dashcast/core/models/UserModel.dart';
import 'package:dashcast/core/models/user_model.dart';
import 'package:dashcast/core/viewmodels/notifiers/product_notifier.dart';

import './Product.dart';

// to be set somewhere else
const shippingRate = 5;
const VAT = 15.0;

class Order {
  final UserModel owner;
  final List<Product> product;
  final DateTime dateCreated;
  bool delivered;
  DateTime datePaid;
  bool paid;
  final String invoiceCode;
  String paymentCode;
  final DateTime expectedDeliverydate;
  final int saleNumber;
  final int itemsCount;
  double itemsCost;
  bool gotIssues;
  List<String> issues;
  double orderWeight;

  double get totalCost =>
      (itemsCost + product.itemWeight * itemsCount * shippingRate) *
      ((100 + VAT) / 100);

  Order(
      {this.owner,
      this.saleNumber,
      this.itemsCount,
      this.datePaid,
      this.product,
      this.dateCreated,
      this.expectedDeliverydate,
      this.delivered,
      this.paid,
      this.invoiceCode,
      this.paymentCode})
      : itemsCost = itemsCount * product.price,
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
