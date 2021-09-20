import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_veg/core/models/review_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/wishlist_notifier.dart';
import 'package:fruit_veg/ui/widgets/review_card.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../../core/models/Product.dart';
import '../../ui/views/account.dart';
import '../../ui/views/cart.dart';
import '../../ui/viewutils/textutils.dart';
import '../../ui/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedTab = 0;

  List<Product> _relatedProducts = [];

  Widget _buildRelatedProducts() {
    return Row(
      children: <Widget>[
        for (var i = 0; i < _relatedProducts.length; i++)
          Row(
            children: <Widget>[
              ProductCard(
                product: _relatedProducts[i],
                discount: 12.5,
              ),
              SizedBox(
                width: 15,
              )
            ],
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _relatedProducts = myList
        .where((element) =>
            (element.variety == widget.product.variety) ||
            (element.brand
                .toLowerCase()
                .contains(widget.product.brand.toLowerCase())))
        .toList();
    return Container(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            body: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 300,
                    backgroundColor: Color(0xFFF0F4F8),
                    pinned: true,
                    actions: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              print('Pressed on Tap for Cart');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cart(),
                                  ));
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              color: iconColor,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Account()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 15.0)
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft:  Radius.circular(40),
                    //         bottomRight: Radius.circular(40))),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        widget.product.imagePath,
                        fit: BoxFit.cover,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: Text(widget.product.name),
                      ),
                    ),
                    bottom: TabBar(
                        indicator: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30))),
                        onTap: (value) {
                          setState(() {
                            _selectedTab = value;
                          });
                        },
                        tabs: [
                          Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                color: (_selectedTab == 0)
                                    ? boxContainerBackGround
                                    : Colors.transparent,
                                border: (_selectedTab == 0)
                                    ? Border.all(color: Colors.transparent)
                                    : Border.all(color: iconColor, width: 1),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                    right: Radius.circular(30))),
                            child: Center(
                              child: Text('Product',
                                  style: (_selectedTab == 0)
                                      ? TextStyle(
                                          color: Colors.white, fontSize: 14)
                                      : TextStyle(
                                          color: iconColor, fontSize: 14)),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                color: (_selectedTab == 1)
                                    ? boxContainerBackGround
                                    : Colors.transparent,
                                border: (_selectedTab == 1)
                                    ? Border.all(color: Colors.transparent)
                                    : Border.all(color: iconColor, width: 1),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                    right: Radius.circular(30))),
                            child: Center(
                              child: Text('Detail',
                                  style: (_selectedTab == 1)
                                      ? TextStyle(
                                          color: Colors.white, fontSize: 14)
                                      : TextStyle(
                                          color: iconColor, fontSize: 14)),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                color: (_selectedTab == 2)
                                    ? boxContainerBackGround
                                    : Colors.transparent,
                                border: (_selectedTab == 2)
                                    ? Border.all(color: Colors.transparent)
                                    : Border.all(color: iconColor, width: 1),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30),
                                    right: Radius.circular(30))),
                            child: Center(
                              child: Text('Review',
                                  style: (_selectedTab == 2)
                                      ? TextStyle(
                                          color: Colors.white, fontSize: 14)
                                      : TextStyle(
                                          color: iconColor, fontSize: 14)),
                            ),
                          ),
                        ]),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: TabBarView(children: [
                        ProductTab(
                          buildRelatedProducts: _buildRelatedProducts,
                          product: widget.product,
                        ),
                        DetailsTab(
                          buildRelatedProducts: _buildRelatedProducts,
                          product: widget.product,
                        ),
                        ReviewTab()
                      ]),
                    )
                  ]))
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<WishListNotifier>(context)
                                        .addProduct(widget.product);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(30),
                                            right: Radius.circular(30))),
                                    child: Center(
                                        child: Icon(Icons.favorite_border)),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // add to cart
                                    Provider.of<CartNotifier>(context)
                                        .addProduct(widget.product);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(30),
                                            right: Radius.circular(30))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceEvenly,
                                          //   children: <Widget>[
                                          //     Icon(
                                          //       Icons.remove_circle_outline,
                                          //       color: Colors.white,
                                          //     ),
                                          //     Text('2'),
                                          //     Icon(
                                          //       Icons.add_circle_outline,
                                          //       color: Colors.white,
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Share',
                            style: headerTextStyle,
                          ),
                          TextButton(
                              child: Icon(FontAwesomeIcons.share),
                              onPressed: () {
                                final RenderObject? box =
                                    context.findRenderObject();
                                Share.share('Share details of Product',
                                    subject: 'Share product',
                                    sharePositionOrigin: box!.paintBounds);
                              })
                        ],
                      ),
                    )
                  ],
                )),
          ],
        )),
      ),
    );
  }
}

// class ProductTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color:Colors.red
//     );
//   }
// }

class DetailsTab extends StatelessWidget {
  final Function buildRelatedProducts;
  final Product product;
  const DetailsTab(
      {Key? key, required this.product, required this.buildRelatedProducts})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF0F4F8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Icon(
                  Icons.description,
                  color: iconColor,
                ),
                Text('Description', style: headerTextStyle),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 12, color: Color(0xFF0E7C86)),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(children: <Widget>[
            //     Icon(
            //       Icons.developer_mode,
            //       color: iconColor,
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     // build these according to the variety product
            //     Text('Specifications', style: headerTextStyle),
            //   ]),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '''We are working on a big project we are working day in day out to finish.We are all going somewhere whether its the podcast blaring from your headphones as you walk down the street or the essay that encourages you to take on that big project.There is a real joy in getting lost in the kind of story that feels like a destination unto itself
            // ''',
            //     style: TextStyle(fontSize: 12, color: Color(0xFF0E7C86)),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.pages,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Related Products',
                    style: headerTextStyle,
                  )
                ],
              ),
            ),
            // TODO replace with dynamically loaded stuff at least refactored to a function
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: buildRelatedProducts()),
              ),
            )
          ],
        ));
  }
}

//  build like in the brands side of things
class ReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F4F8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: reviews
              .map((review) => ReviewItem(
                    userReview: review,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ProductTab extends StatefulWidget {
  final Function buildRelatedProducts;
  final Product product;
  const ProductTab(
      {Key? key, required this.product, required this.buildRelatedProducts})
      : super(key: key);
  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  int colorIndex = 1;
  int sizeIndex = 1;
  double _weight = 1.0;
  void prepareTodAddToCart() {
    // create same product with chosen weight
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Wrap(children: <Widget>[
                  Text(widget.product.name, style: headerTextStyle)
                ]),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.product.rating.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('\$${widget.product.price}  ', style: headerTextStyle),
                SizedBox(
                  width: 260,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('${widget.product.sales} Sales',
                      style: TextStyle(color: Color(0xFF0E7C86), fontSize: 12)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Select Weight',
                            style: TextStyle(
                                color: Color(0xFF0E7C86),
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                        Text('${_weight.toStringAsPrecision(3)} kg',
                            style: TextStyle(
                                color: Color(0xFF0E7C86),
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Slider(
                      max: widget.product.maxWeight,
                      min: 0,
                      value: _weight,
                      onChanged: (value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Price per Kilo',
                                style: TextStyle(
                                    color: Color(0xFF0E7C86),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text('\$${widget.product.costPerKilo}')
                          ],
                        ),
                        Column(
                          children: [
                            Text('Total Cost',
                                style: TextStyle(
                                    color: Color(0xFF0E7C86),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                '\$${(widget.product.costPerKilo * _weight).toStringAsPrecision(3)}')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.all(10),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Select Size',
                              style: TextStyle(
                                  color: Color(0xFF0E7C86),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    // Size Picker handler
                                    setState(() {
                                      if (sizeIndex == 2) {
                                        sizeIndex = 0;
                                      } else {
                                        sizeIndex = 2;
                                      }
                                    });
                                  },
                                  child: sizeIndex == 2
                                      ? Chip(
                                          label: Row(
                                          children: <Widget>[
                                            Icon(Icons.check, size: 12),
                                            Text('S',
                                                style: TextStyle(
                                                    color: headerTextColor))
                                          ],
                                        ))
                                      : Chip(
                                          label: Text('S',
                                              style: TextStyle(
                                                  color: headerTextColor)))),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (sizeIndex == 3) {
                                        sizeIndex = 0;
                                      } else {
                                        sizeIndex = 3;
                                      }
                                    });
                                  },
                                  child: sizeIndex == 3
                                      ? Chip(
                                          label: Row(
                                            children: <Widget>[
                                              Icon(Icons.check, size: 12),
                                              Text('M',
                                                  style: TextStyle(
                                                      color: headerTextColor))
                                            ],
                                          ),
                                        )
                                      : Chip(
                                          label: Text('M',
                                              style: TextStyle(
                                                  color: headerTextColor)))),
                              GestureDetector(
                                  onTap: () {
                                    //Size picker handler
                                    setState(() {
                                      if (sizeIndex == 4) {
                                        sizeIndex = 0;
                                      } else {
                                        sizeIndex = 4;
                                      }
                                    });
                                  },
                                  child: sizeIndex == 4
                                      ? Chip(
                                          label: Row(
                                            children: <Widget>[
                                              Icon(Icons.check, size: 12),
                                              Text('L',
                                                  style: TextStyle(
                                                      color: headerTextColor))
                                            ],
                                          ),
                                        )
                                      : Chip(
                                          label: Text('L',
                                              style: TextStyle(
                                                  color: headerTextColor)))),
                              GestureDetector(
                                  onTap: () {
                                    //Size picker handler
                                    setState(() {
                                      if (sizeIndex == 5) {
                                        sizeIndex = 0;
                                      } else {
                                        sizeIndex = 5;
                                      }
                                    });
                                  },
                                  child: sizeIndex == 5
                                      ? Chip(
                                          label: Row(
                                            children: <Widget>[
                                              Icon(Icons.check, size: 12),
                                              Text('XL',
                                                  style: TextStyle(
                                                      color: headerTextColor))
                                            ],
                                          ),
                                        )
                                      : Chip(
                                          label: Text('XL',
                                              style: TextStyle(
                                                  color: headerTextColor)))),
                            ],
                          )
                        ]))),
          ),
          // Related Products scrollview
          // TODO replace with dynamically loaded stuff a quater to get there
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: widget.buildRelatedProducts()),
            ),
          )
        ],
      ),
    );
  }
}
