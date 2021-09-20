import 'package:dashcast/core/models/UserModel.dart';

class UserModel{
   User user;
   String phoneNumber;
   String company;
   String address1;
   String address2;
   String city;
   String postCode;
   String country;
   String region;

  UserModel({this.user,this.phoneNumber, this.company, this.address1, this.address2, this.city, this.postCode, this.country, this.region});

  set userSetter(value)=>user=user;
     
}

class AddressDetails{
  String company;
   String address1;
   String address2;
   String city;
   String postCode;
   String country;
   String region;
   AddressDetails({this.address1,this.address2,this.city,this.company,this.country,this.postCode,this.region});
}



var myUsers=[
  UserModel(
    user: User(
      birthDate: "1997-06-23",
       emailAdress: "linvle2@gmail.com",
       fullName: "Linval Muchapirei",
       gender: Gender.Male
    ),
    address1: "21 17th Crescent Warren Park",
    address2: "None",
    city: "Harare",
    company: "TechSons",
    country: "Zimbabwe",
    phoneNumber: "+263787452541",
     postCode: "0000",
     region: "Harare"
  ),
];