import 'package:clay_containers/clay_containers.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:fruit_veg/ui/widgets/cart_unit_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/Product.dart';
import '../../ui/views/checkout.dart';
import '../../ui/viewutils/textutils.dart';
import '../../ui/widgets/cart_item.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final PageController _pageController = PageController();
  Widget _getCartProducts(List<Product> product) {
    return (product.isEmpty
        ? Center(child: Text("Loading"))
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                for (var i = 0; i < product.length; i++)
                  CartItem(
                    product: product[i],
                  ),
              ],
            ),
          ));
  }

  Widget _getCartProductsFruits(List<FruitProduct> fruitProducts) {
    return fruitProducts.isEmpty
        ? Center(child: Text("Is empty add something"))
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: fruitProducts
                  .map((product) => CartItemFruit(
                        product: product,
                      ))
                  .toList(),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    // find a way to intialise products in the cart TODO
    // var cartService=Provider.of<CartNotifier>(context);
    // cartService.productLoader();

    return Consumer<CartNotifier>(
      builder: (context, cart, child) => Container(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Color(0xFFF0F4F8),
              body: Column(
                children: <Widget>[
                  Flexible(
                    flex: 8,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          leading: InkWell(
                            onTap: () {
                              // navigate back to previous page
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: iconColor,
                            ),
                          ),
                          backgroundColor: Color(0xFFF0F4F8),
                          title: Text(
                            'Cart',
                            style: headerTextStyle,
                          ),
                          actions: <Widget>[
                            // profile placeholder
                            Container(
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
                                backgroundColor: headerTextColor,
                              ),
                            ),
                          ],
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.shopping_cart,
                                  color: iconColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Shopping Cart',
                                      style: headerTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Verify your quantity and click checkout',
                                      style: TextStyle(
                                          fontSize: 12, color: headerTextColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TabBar(tabs: [
                            Tab(
                                child: Text(
                              'Vegetables',
                              style: headerTextStyle,
                            )),
                            Tab(
                              child: Text('Fruits', style: headerTextStyle),
                            )
                          ]),
                          // _getCartProducts(cart.products)
                          Container(
                            height: MediaQuery.of(context).size.height * .65,
                            child: TabBarView(children: [
                              _getCartProducts(
                                  cart.products.toList() as List<Product>),
                              _getCartProductsFruits(cart.fruitProducts.toList()
                                  as List<FruitProduct>)
                            ]),
                          )
                        ])),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          ClayContainer(
                            height: MediaQuery.of(context).size.height * .4,
                            width: MediaQuery.of(context).size.height,
                            depth: 3,
                            spread: 12,
                            child: Stack(
                              children: [
                                PageView(
                                  physics: ClampingScrollPhysics(),
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: Text(
                                                'Unit Products Fruits',
                                                style: headerTextStyle,
                                              )),
                                          Flexible(
                                            flex: 9,
                                            child: ListView(
                                              scrollDirection: Axis.vertical,
                                              children: cart.unitProductFruits
                                                  .map((unitProductFruit) =>
                                                      CartItemUnitFruit(
                                                        unitProductFruit:
                                                            unitProductFruit,
                                                      ))
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.yellow,
                                      child: Column(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: Text(
                                                'Unit Products Vegetables',
                                                style: headerTextStyle,
                                              )),
                                          Flexible(
                                              flex: 9,
                                              child: ListView(
                                                children: cart
                                                    .unitProductVegetables
                                                    .map((unitProductVegetable) =>
                                                        CartItemUnitVegetable(
                                                          unitProductVegetable:
                                                              unitProductVegetable,
                                                        ))
                                                    .toList(),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]))
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Subtotal",
                                    style: cartTextStyle,
                                  ),
                                  Text(
                                    "\$${cart.subTotal.toStringAsPrecision(4)}",
                                    style: cartTextStyle,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("TAX(${cart.taxRate}%)",
                                      style: cartTextStyle),
                                  Text(
                                      "\$${cart.totalTax.toStringAsPrecision(4)}",
                                      style: cartTextStyle)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // navigate to the checkout page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Checkout(),
                                    ));
                              },
                              child: Container(
                                  width: 400,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(20))),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                          top: 12,
                                          right: 200,
                                          child: Text(
                                            'Checkout',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      Positioned(
                                          top: 10,
                                          right: 60,
                                          child: Text(
                                            "\$${cart.subTotal.toStringAsPrecision(4)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
