

class UserReview{
  final String reviewerName;
  final double reviewRating;
  final String reviewText;
  final DateTime reviewDate;
  final String imagePath;
  final String brandName;
  final String productName;
  final int brandId;

  UserReview({this.reviewerName, this.reviewRating,this.brandId, this.reviewText, this.reviewDate, this.imagePath,this.brandName,this.productName});

}


final reviews=<UserReview>[
  UserReview(
    brandName: "Apple",
    productName: "iphone SE 2020",
    imagePath: "null for now",
    reviewRating: 3.2,
    brandId:121,
    reviewDate: DateTime(2017,9,7,18,45),
    reviewerName: 'Maria R. Garza',
    reviewText: 'There are a few foods that predate colonization and the European colonization of\n the Americans brought about the introduction of a large number of \ningredients'
  ),
  UserReview(
    imagePath: 'null for now',
    brandName: "Google",
    brandId:12,
    productName: "Google Pixel 4XL",
    reviewRating: 4.2,
    reviewDate: DateTime(2018,6,23,17,56),
    reviewerName: 'Linval Muchapirei',
    reviewText: 'The Google Pixel has the best camera out of a smartphone period,it takes sharp and \ncontrasty photos that are close to what the eye expects out of a phone\n camera.Well done google '
  ),
   UserReview(
    imagePath: 'null for now',
    reviewRating: 4.2,
    brandName: "Google",
    brandId:12,
    productName: "Google Pixel buds",
    reviewDate: DateTime(2018,6,23,17,56),
    reviewerName: 'Linval Muchapirei',
    reviewText: 'The Google Pixel buds are the best airbuds period,they are comfortable \n and produce sound thats close to what the ears expects out of a headphones\n combine with assistant features they are the best and a retail of \$179 thats just enough.Well done google '
  ),
   UserReview(
    imagePath: 'null for now',
    brandName: "Google",
    brandId:12,
    productName: "Google Pixel",
    reviewRating: 4.2,
    reviewDate: DateTime(2018,6,23,17,56),
    reviewerName: 'Linval Muchapirei',
    reviewText: 'The Google Pixel buds are the best airbuds period,they are comfortable \n and produce sound thats close to what the ears expects out of a headphones\n combine with assistant features they are the best and a retail of \$179 thats just enough.Well done google '
  ),
   UserReview(
    imagePath: 'null for now',
    brandName: "Google",
    productName: "Google Pixel",
    brandId:12,
    reviewRating: 4.2,
    reviewDate: DateTime(2018,6,23,17,56),
    reviewerName: 'Linval Muchapirei',
    reviewText: 'The Google Pixel buds are the best airbuds period,they are comfortable \n and produce sound thats close to what the ears expects out of a headphones\n combine with assistant features they are the best and a retail of \$179 thats just enough.Well done google '
  ),
];