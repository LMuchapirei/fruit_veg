import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/wishlist_notifier.dart';
import 'package:provider/provider.dart';
import '../../core/models/Product.dart';
import '../../ui/views/cart.dart';
import '../../ui/viewutils/textutils.dart';
import '../../ui/widgets/wishlist_item.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(body: WishListDefaultPage())));
  }
}

class WishListDefaultPage extends StatefulWidget {
  @override
  _WishListDefaultPageState createState() => _WishListDefaultPageState();
}

enum View { GRID, LIST }

class _WishListDefaultPageState extends State<WishListDefaultPage> {
  View _selectedView = View.GRID;
  Color _selectedViewIconColor = iconColor;
  Widget _buildList(UnmodifiableListView<Product> inputList) {
    return inputList.isEmpty
        ? Center(child: Text('No Products Add'))
        : Column(
            children: inputList
                .map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: WishItemList(
                        product: product,
                      ),
                    ))
                .toList(),
          );
  }

  Widget _buildFruitList(UnmodifiableListView<FruitProduct> inputList) {
    return inputList.isEmpty
        ? Center(
            // build something interesting for this
            child: Text('No Products Add'))
        : Column(
            children: inputList
                .map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: WishItemListFruit(
                        product: product,
                      ),
                    ))
                .toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListNotifier>(context);
    wishListProvider.intialiseProducts();
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: iconColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                backgroundColor: Color(0xFFD9E2EC),
                elevation: 0,
                title: Text(
                  "Favorites",
                  style: headerTextStyle,
                ),
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
                      Container(
                        width: 25,
                        height: 25,
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
                    ],
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: headerTextColor,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: headerTextStyle,
                        unselectedLabelStyle:
                            headerTextStyle.copyWith(color: Colors.grey),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, blurRadius: 2)
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 16, left: 16, top: 12, bottom: 12),
                                child: Text(
                                  "Vegetables",
                                  // style: headerTextStyle.copyWith(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54, blurRadius: 2)
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 16, left: 16, top: 12, bottom: 12),
                                child: Text(
                                  "Fruits",
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite_border,
                                color: iconColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'WishList',
                                style: headerTextStyle,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedView = View.LIST;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.list,
                                    color: _selectedView == View.LIST
                                        ? _selectedViewIconColor
                                        : Colors.grey,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedView = View.GRID;
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.thList,
                                    color: _selectedView == View.GRID
                                        ? _selectedViewIconColor
                                        : Colors.grey,
                                  ))
                            ],
                          )
                        ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 5,
            child: TabBarView(children: [
              VegetablesTab(
                key: Key("Vegetables"),
                buildList: _buildList,
                products: wishListProvider.productsWishList,
                selectedView: _selectedView,
              ),
              FruitsTab(
                key: Key("Fruits"),
                buildList: _buildFruitList,
                products: wishListProvider.fruitProductsWishList,
                selectedView: _selectedView,
              )
            ]))
      ],
    );
  }
}

class VegetablesTab extends StatelessWidget {
  final View selectedView;
  final Function buildList;
  final UnmodifiableListView<Product>
      products; //[find a way to accept both list and determine how to andle each type]

  const VegetablesTab(
      {Key? key,
      required this.selectedView,
      required this.buildList,
      required this.products})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      selectedView == View.LIST
          ? SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: buildList(products),
                )
              ]),
            )
          : SliverGrid.count(
              children: products
                  .map((product) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WishItemGrid(product: product),
                      ))
                  .toList(),
              crossAxisCount: 2)
    ]);
  }
}

class FruitsTab extends StatelessWidget {
  final View selectedView;
  final Function buildList;
  final UnmodifiableListView<FruitProduct>
      products; //[find a way to accept both list and determine how to andle each type]

  const FruitsTab(
      {Key? key,
      required this.selectedView,
      required this.buildList,
      required this.products})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      selectedView == View.LIST
          ? SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: buildList(products),
                )
              ]),
            )
          : SliverGrid.count(
              children: products
                  .map((product) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WishItemFruitGrid(
                          product: product,
                        ),
                      ))
                  .toList(),
              crossAxisCount: 2)
    ]);
  }
}
