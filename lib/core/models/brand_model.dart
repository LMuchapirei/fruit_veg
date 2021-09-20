
import 'dart:math';

import 'package:flutter/material.dart';

class Brand{
  final int brandId;
  final String brandName;
  final double rating;
  final String imagePath;
  final Color brandThemeColor;
  final String brandDescription;
  final String url;
  Brand({this.brandDescription,this.url,this.brandName, this.rating, this.imagePath,this.brandThemeColor})
  :brandId=Random().nextInt(100000);   //replace with a cached dynamically loaded image

    operator ==(other)=>
  (other is Brand) &&(brandName==other.brandName)&&(url==other.url)&&(imagePath==other.imagePath)&&(brandId==other.brandId);

  int get hashCode=>brandName.hashCode^url.hashCode^imagePath.hashCode^brandId.hashCode;
}



List<Brand> brands=[
  Brand(brandName: "One plus",url: "https://www.oneplus.com/global",imagePath: "assets/images/mobile-phone.jpg",rating: 4.2,brandThemeColor:Colors.grey,brandDescription:'Leading manufacturer started in the midrange market in early 2013 with the popular one plus flagship specs at fraction of flagship price'),
  Brand(brandName:"Apple",url: "https://www.apple.com/",imagePath: "assets/images/mobile-phone.jpg",rating: 4.5,brandThemeColor:Color(0xFFD9E2EC),brandDescription:'Inventor of the modern smartphone, when Steve Jobs took to the stage to show the iphone.Mac and related stuff that are popular today'),
  Brand(brandName: "Dell",url: "https://www.dell.com/en-us",imagePath:"assets/images/office.jpg",rating: 4.3,brandThemeColor:Colors.black.withOpacity(0.7),brandDescription:'Relevant PC maker with the highly popular and innovative Dell XPS 13 the programmers laptop running windows'),
  Brand(brandName: "HewLett Packard",url: "https://www8.hp.com/us/en/home.html",imagePath:"assets/images/office.jpg",rating: 4.3,brandThemeColor:Colors.blueAccent,brandDescription:'HP the poorman pc but now competing with the high end makers like Apple wit highly popular Spectre line'),
  Brand(brandName: "Microsoft",url: "https://www.microsoft.com/en-us/",imagePath:"assets/images/office.jpg",rating: 4.3,brandThemeColor:Colors.blue,brandDescription:'Once king of the hill until google and the other boys took over,but in terms of hardware the Surface line is killing by your Surface Book 3 here'),
  Brand(brandName: "Google",url: "https://abc.xyz/",imagePath:"assets/images/office.jpg",rating: 4.3,brandThemeColor:Colors.redAccent,brandDescription:'Everbody got gmail but here we are dealing with the Pixel line,Pixel phones the best cameras out there in a phone,Pixel buds smartest wireless buds with passive noise cancellation check out our merchandies'),
  // Brand(brandName: "One plus",url: "paceholderurl",imagePath: "assets/images/mobile-phone.jpg",rating: 4.2,brandThemeColor:Colors.grey,brandDescription:'Leading manufacturer started in the midrange market in early 2013 with the popular one plus flagship specs at fraction of flagship price'),
 
]; 