import 'dart:collection';
import 'package:dashcast/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:dashcast/core/viewmodels/notifiers/product_notifier.dart';
import 'package:dashcast/ui/views/categories.dart';
import 'package:dashcast/ui/views/login_screen.dart';
// import 'package:dashcast/ui/widgets/bottombar.dart';
import 'package:dashcast/ui/widgets/recommendedFruits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql/client.dart';
import 'package:provider/provider.dart';
import '../../core/models/Product.dart';
import '../../ui/views/account.dart';
import '../../ui/views/cart.dart';
import '../../ui/viewutils/textutils.dart';
import '../../ui/widgets/product_card.dart';
import '../../ui/widgets/recommended_card.dart';
import '../../ui/widgets/scrollview_item.dart';
import '../../ui/widgets/selectable_items.dart';
import 'fruit_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///State nanagement for the recommended view
  int selectedCategoryIndex = 1; //use the enums later on
  ///[index 1 is the desktop]
  ///[index 2 is the  smartphone]
  ///[index 3 is the software]
  ///[index 4 hardware /components]

  ///[desktop]
  ///[smartphone]
  ///[software]
  ///[hardware/componnets]
  int recommendedForYouDummyCount = 6;
  @override
  initState() {
    super.initState();
  }

  // very important function
  SliverGrid _buildRecommendVegetableList(
      int index, UnmodifiableListView<ProductCategory> category) {
    SliverGrid sliverGrid;
    switch (index) {
      case 1:
        final leafyGreenCategory = category
            .where((element) => element.productCategory == Variety.Leafy_Green)
            .toList()[0];
        print(leafyGreenCategory.productCategory);
        if (leafyGreenCategory.products.isEmpty &&
            !leafyGreenCategory.isLoading) {
          // trying to load new stuff for recommended tab
          Future(() => leafyGreenCategory.refresh());
        }
        sliverGrid = SliverGrid.count(
          children: <Widget>[
            for (var i = 0; i < leafyGreenCategory.products.length; i++)
              Container(
                  width: 200,
                  height: 300,
                  child: Center(
                      child: RecommendedCard(
                    product: leafyGreenCategory.products[i],
                  )))
          ],
          crossAxisCount: 2,
        );
        break;
      case 2:
        final cruciferousCategory = category[1];
        if (cruciferousCategory.products.isEmpty &&
            !cruciferousCategory.isLoading) {
          Future(() => cruciferousCategory.refresh());
        }
        sliverGrid = SliverGrid.count(
          children: <Widget>[
            for (var i = 0; i < cruciferousCategory.products.length; i++)
              Container(
                  width: 200,
                  height: 300,
                  child: Center(
                      child: RecommendedCard(
                          product: cruciferousCategory.products[i])))
          ],
          crossAxisCount: 2,
        );
        break;
      case 3:
        final marrowCategory = category[2];

        if (marrowCategory.products.isEmpty && !marrowCategory.isLoading) {
          Future(() => marrowCategory.refresh());
        }
        sliverGrid = SliverGrid.count(
          children: <Widget>[
            for (var i = 0; i < marrowCategory.products.length; i++)
              Container(
                  width: 200,
                  height: 300,
                  child: Center(
                      child: RecommendedCard(
                    product: marrowCategory.products[i],
                  )))
          ],
          crossAxisCount: 2,
        );
        break;
      case 4:
        final rootCategory = category[3];
        if (rootCategory.products.isEmpty && !rootCategory.isLoading) {
          Future(() => rootCategory.refresh());
        }
        sliverGrid = SliverGrid.count(children: <Widget>[
          for (var i = 0; i < rootCategory.products.length; i++)
            Container(
                child: Center(
                    child: RecommendedCard(
              product: rootCategory.products[i],
            )))
        ], crossAxisCount: 2);
        break;
      case 5:
        final stemCategory = category[4];
        if (stemCategory.products.isEmpty && !stemCategory.isLoading) {
          Future(() => stemCategory.refresh());
        }
        sliverGrid = SliverGrid.count(children: <Widget>[
          for (var i = 0; i < stemCategory.products.length; i++)
            Container(
                child: Center(
                    child: RecommendedCard(
              product: stemCategory.products[i],
            )))
        ], crossAxisCount: 2);
        break;
      case 6:
        final alluimCategory = category[4];
        if (alluimCategory.products.isEmpty && !alluimCategory.isLoading) {
          Future(() => alluimCategory.refresh());
        }
        sliverGrid = SliverGrid.count(children: <Widget>[
          for (var i = 0; i < alluimCategory.products.length; i++)
            Container(
                child: Center(
                    child: RecommendedCard(
              product: alluimCategory.products[i],
            )))
        ], crossAxisCount: 2);
        break;

      default:
    }
    return sliverGrid;
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductNotifier>(context);
    final categories = productProvider.category;
    return Container(
        height: MediaQuery.of(context).size.height,
        // color: const Color(0xFFDCEEFB),
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                      accountName: Text('Linval Tanya'),
                      accountEmail: Text('linvle2@gmail.com')),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.storage),
                    title: Text(
                      'MyOrders',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    trailing: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text('8'),
                        )),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(
                      'Wish List',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 12),
                    child: Text('Products'),
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie_creation),
                    title: Text(
                      'Brands',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 12),
                    child: Text('Application Preferences'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'Help & Support',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      'Languages',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 9,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        leading: Icon(
                          Icons.list,
                          color: iconColor,
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text(
                          'Home',
                          style: headerTextStyle,
                        ),
                        centerTitle: true,
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
                                child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: buttonColor),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                                                      child: Container(
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.white
                  ),
                  child: Center(
                    // this should be linked to the number of items in cart
                    child: Text(
                      '${Provider.of<CartNotifier>(context).itemsCount}',
                      style: TextStyle(color: Color(0xFF399D63),
                      fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ),
                          ),
                          Center(
                            child: Icon(Icons.shopping_cart, color: Colors.white),
                          ),
                        ],
                      ),
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
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            // get the clay container stuff
                            child: Container(
                                width: 300,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Search',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.grey.shade300,
                                            hintStyle: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 10),
                                      child: Icon(Icons.settings,
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height *
                                  .2, //before it was 200
                              width: 400,
                              color: Colors.grey,
                              child: ScrollingImageView(),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      // get some of the icons ok
                                      Icon(
                                        Icons.speaker,
                                        color: iconColor,
                                      ),
                                      Text('Flash Sales',
                                          style: headerTextStyle),
                                    ],
                                  )
                                ],
                              )),
                          // this content should be loaded from a service in the backend flash sales category
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              child: StreamBuilder<List<Product>>(
                                  initialData: myList..take(12),
                                  stream: productProvider.flashProducts,
                                  builder: (context,
                                      AsyncSnapshot<List<Product>> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: snapshot.data
                                            .map(
                                              (Product product) => Padding(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: ProductCard(
                                                    product: product,
                                                    discount: 15.7),
                                              ),
                                            )
                                            .toList());
                                  }),
                            ),
                          ),
                          // Items scrollbar
                          // Recommended For you try to find the icons please
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star_border,
                                  color: iconColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Recommended Vegetables For You",
                                  style: headerTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 500,
                            height: 90,
                            child: Row(
                              children: <Widget>[
                                //TODO :page to pick recommended stuff
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Categories(),
                                    ));
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: boxContainerBackGround,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // width: 380,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: boxContainerBackGround,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30))),
                                    // Scrollable list of products
                                    // the products should be fetched from the repository based on category
                                    // allow user to pick the categories he or she wants to be recommended
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            selectedCategoryIndex == 1
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          1) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      index: 1,
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        'assets/images/cauliflower.svg',
                                                        height: 40,
                                                        color: iconColor,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      text: 'Cruciferous',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            1;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        'assets/images/cauliflower.svg',
                                                        height: 40,
                                                        color: Colors.white,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      index: 1,
                                                    )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            selectedCategoryIndex == 2
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          2) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                          //  need to change the type of products being displayed
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        'assets/images/Spinach.svg',
                                                        color: iconColor,
                                                        height: 40,
                                                      ),
                                                      index: 2,
                                                      text: 'Leafy Green',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            2;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture: SvgPicture.asset(
                                                          'assets/images/Spinach.svg',
                                                          color: Colors.white,
                                                          height: 40),
                                                      index: 2,
                                                    )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            selectedCategoryIndex == 3
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          3) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                          //  need to change the type of products being displayed
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        'assets/images/PlainPumpkin.svg',
                                                        color: iconColor,
                                                        height: 40,
                                                      ),
                                                      index: 3,
                                                      text: 'Marrow',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            3;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        'assets/images/PlainPumpkin.svg',
                                                        color: Colors.white,
                                                        height: 40,
                                                      ),
                                                      index: 3,
                                                    )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            selectedCategoryIndex == 4
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          4) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                          //  need to change the type of products being displayed
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/1293369693.svg",
                                                        color: iconColor,
                                                        height: 40,
                                                      ),
                                                      index: 4,
                                                      text: 'Allium',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            4;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/1293369693.svg",
                                                        color: Colors.white,
                                                        height: 40,
                                                      ),
                                                      index: 4,
                                                    )),
                                            selectedCategoryIndex == 5
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          5) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                          //  need to change the type of products being displayed
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/food-potato.svg",
                                                        color: iconColor,
                                                        height: 40,
                                                      ),
                                                      index: 5,
                                                      text: 'Root',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            5;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/food-potato.svg",
                                                        color: Colors.white,
                                                        height: 40,
                                                      ),
                                                      index: 5,
                                                    )),
                                            selectedCategoryIndex == 6
                                                ? InkWell(
                                                    onTap: () {
                                                      print("Tapped inner");
                                                      if (selectedCategoryIndex ==
                                                          6) {
                                                      } else {
                                                        setState(() {
                                                          selectedCategoryIndex =
                                                              -1;
                                                          //  need to change the type of products being displayed
                                                        });
                                                      }
                                                    },
                                                    child:
                                                        SelectableItemExandedSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/Asparagus.svg",
                                                        color: iconColor,
                                                        height: 40,
                                                      ),
                                                      index: 6,
                                                      text: 'Stem',
                                                    ))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategoryIndex =
                                                            6;
                                                      });
                                                    },
                                                    child: SelectableItemSvg(
                                                      svgPicture:
                                                          SvgPicture.asset(
                                                        "assets/images/Asparagus.svg",
                                                        color: Colors.white,
                                                        height: 40,
                                                      ),
                                                      index: 6,
                                                    )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                      _buildRecommendVegetableList(
                          selectedCategoryIndex, categories),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star_border,
                                color: iconColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Recommended Fruits For You",
                                style: headerTextStyle,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .8,
                          child: RecommendedFruits(),
                        )
                      ])),
                    ],
                  ),
                ),

                // TODO: Try to build the open container stuff like in the TODO app
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => BrandsPage(),
                                  // ));
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FruitsHome(),
                                  ));
                                },
                                child: Container(
                                    height: 40,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: PrimaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                      child: Text(
                                        'View Fruits',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )))),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Categories(),
                              ));
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  'View Vegetables',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
//           floatingActionButton: FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: () {
//                 const url = 'http://192.168.1.103:3000/graphql/';
//                 final HttpLink _httpLink = HttpLink(uri: url);

//                 final GraphQLClient _client =
//                     GraphQLClient(link: _httpLink, cache: InMemoryCache());

//                 const String makeMutation = r'''
   
// mutation{
//   addProductToCart(cartInput:{
//     ownerId:"5ebfba3db3317813902207e1"
//     productId:"5ebe90eb86db3d097c365416",
//     cartId:"5ebfbdfc682df520cc973672",
//   }){
//     imagePath
//   }
// }
   
//   ''';

//                 final QueryOptions options =
//                     QueryOptions(documentNode: gql(makeMutation));
//                 _client.query(options).then((value) {
//                   print(value.hasException);
//                   print(value.data);
//                 });
//               }),
          // bottomNavigationBar: BottomBar(),
        ));
  }
}




//  Container(
                                  
//                                   child: Stack(
//                                     children: [
//                                       Positioned(
//                                         top: 0.0,
//                                         right:5,
//                                         child: Container(
//                                           height: 28.0,
//                                           width: 28.0,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(9.0),
//                                               color: Colors.white),
//                                           child: Center(
//                                             // this should be linked to the number of items in cart
//                                             child: Text(
//                                               '${Provider.of<CartNotifier>(context).itemsCount}',
//                                               style: TextStyle(
//                                                   color: Color(0xFF399D63),
//                                                   fontFamily: 'Montserrat'),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.center,
//                                                                             child: Icon(
//                                           Icons.shopping_cart,
//                                           color: iconColor,
//                                           size: 25,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),