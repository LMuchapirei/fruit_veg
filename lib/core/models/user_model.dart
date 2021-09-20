import 'UserModel.dart';

class UserModel {
  User user;
  String phoneNumber;
  String company;
  String address1;
  String address2;
  String city;
  String postCode;
  String country;
  String region;

  UserModel(
      {required this.user,
      required this.phoneNumber,
      required this.company,
      required this.address1,
      required this.address2,
      required this.city,
      required this.postCode,
      required this.country,
      required this.region});

  set userSetter(value) => user = user;
}

class AddressDetails {
  String company;
  String address1;
  String address2;
  String city;
  String postCode;
  String country;
  String region;
  AddressDetails(
      {required this.address1,
      required this.address2,
      required this.city,
      required this.company,
      required this.country,
      required this.postCode,
      required this.region});
}

var myUsers = [
  UserModel(
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
];
