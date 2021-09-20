import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:fruit_veg/ui/widgets/category_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: iconColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      mini: true,
                      elevation: 0.0,
                      child: Icon(
                        FontAwesomeIcons.shoppingCart,
                        color: iconColor,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Categories',
                style: headerTextStyle.copyWith(fontSize: 35),
                // style: TextStyle(
                //     fontFamily: 'Montserrat',
                //     fontSize: 35,
                //     fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: headerTextColor,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Leaf Green',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Cruciferous',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Marrow',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Root',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Stem',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Allium',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    )
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  CategoryList(variety: Variety.Leafy_Green),
                  CategoryList(variety: Variety.Cruciferous),
                  CategoryList(variety: Variety.Marrow),
                  CategoryList(variety: Variety.Root),
                  CategoryList(variety: Variety.Stem),
                  CategoryList(
                    variety: Variety.Allium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
