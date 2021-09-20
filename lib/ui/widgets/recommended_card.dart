import 'package:flutter/material.dart';
import '../../core/models/Product.dart';
import '../../ui/viewutils/textutils.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:dashcast/core/models/Product.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RecommendedProduct extends StatelessWidget {
  final Product product;

  const RecommendedProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 260,
          height: 380,
          decoration: BoxDecoration(
              color: Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: <Widget>[
              // Top Section will be an image in an image asset
              // try to use cached image
              Positioned(
                left: 0,
                bottom: 0,
                width: 250,
                child: BottomContainer(
                  price: product.price,
                  productName: product.name,
                  productSales: product.sales.toString(),
                  rating: product.rating.toString(),
                ),
              )
            ],
          )),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final String productName;
  final String productSales;
  final String rating;
  final double price;

  const BottomContainer(
      {Key key, this.productName, this.productSales, this.rating, this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 80,
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // make sure all these values will be dynamic
            Text(productName),
            Text(price.toString()),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: productSales,
                        style: TextStyle(fontSize: 14, color: headerTextColor),
                        children: [
                          TextSpan(
                              text: " Sales",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF14919B)))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          rating,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}






class RecommendedCard extends StatelessWidget {
  final Product product;

  const RecommendedCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final paddingConst = 20.0;
    return ClayContainer(
      borderRadius: 15,
      width: width / 2 - 2 * paddingConst,
      height: height * .3,
      color: Colors.white,
      child: Column(
        children: [
          Flexible(
              flex: 6,
              child: Container(
                  child: Image(
                image: AssetImage(product.imagePath),
                fit: BoxFit.fill,
              ))),
          SizedBox(height: 10,),
          Flexible(flex:4,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,style: headerTextStyle.copyWith(fontSize:16),),
                Text("\$"+product.price.toString(),style: headerTextStyle.copyWith(fontSize:15),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(product.sales.toString()+" Sales",style: headerTextStyle.copyWith(fontSize:14),),
                  Row(children: [
                    Icon(FontAwesomeIcons.star,color: Colors.yellow,),
                    Text(product.rating.toString(),style: headerTextStyle.copyWith(fontSize:14),)
                  ],)
                ],)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
