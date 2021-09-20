import 'package:dashcast/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:dashcast/core/viewmodels/notifiers/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/Product.dart';
import '../../ui/views/productpage.dart';
import '../../ui/viewutils/textutils.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double discount;

  const ProductCard({Key key, this.product,this.discount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to the prodyct details page
        print("pressed on tap");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductPage(
            product:product
          ),
        ));
      },
      child: Container(
        width: 180,
        height: MediaQuery.of(context).size.height*.25,   //from 200
        decoration: BoxDecoration(
          color: closeWhiteBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), offset: Offset(3.0, 10.0), blurRadius: 15.0)]
        ),
        child: Stack(
          children: <Widget>[
            // top part should be an image
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height:MediaQuery.of(context).size.height*.25*0.6,// 120,
                width: 180,
                child: Image.asset(product.imagePath),
              ),
            ),
            Positioned(top: 10, right: 2, child: CircularButton(discount:discount)),
            Positioned(
              left: 0,
              bottom: 0,
              width: 180,
              child: BottomContainer(product:product),
            )
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double discount;

  const CircularButton({Key key, this.discount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 24,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10),
          left: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          '$discount%',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final Product product;

  const BottomContainer({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 115,
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // make sure all these values will be dynamic
          Text(product.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                product.sales.toString(),
                style: headerTextStyle.copyWith(fontSize: 12,),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    product.rating.toString(),
                    style: headerTextStyle.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '${product.leftInStock} Available',
              style: TextStyle(
                  fontSize: 12,
                  color: headerTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.deepOrangeAccent,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              //Navigator to the cart page
              // product bloc o provider whatever function to add product into cart
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
GestureDetector(
  onTap: () {
    final cartNotifier=Provider.of<CartNotifier>(context);
    cartNotifier.addProduct(product);

  },
                                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10),
                        left: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            'ADD TO CART',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  
                  onTap: () { 
                  Provider.of<WishListNotifier>(context).addProduct(product);
                  },
                  child:Icon(Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
