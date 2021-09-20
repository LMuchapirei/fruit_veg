import 'package:dashcast/core/viewmodels/notifiers/fruit_products_notifier.dart';
import 'package:dashcast/ui/views/fruits_home.dart';
import 'package:dashcast/ui/viewutils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../viewutils/textutils.dart';
class RecommendedFruits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProductNotifier>(context);
    final fruitCategoryProvider = fruitProvider.category;

    return DefaultTabController(
      length: fruitCategoryProvider.length,
      child: Scaffold(
        body: Container(
          
          child: SingleChildScrollView(
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TabBar(
                    isScrollable: true,
                    indicator:  BoxDecoration(
                      color: iconColor,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(20),
                                            right: Radius.circular(20)),
                            ),
                    labelStyle: headerTextStyle.copyWith(
                      color: Colors.white
                    ),
                    unselectedLabelStyle: headerTextStyle.copyWith(
                      color:headerTextColor
                    ),
                    tabs: fruitCategoryProvider
                        .map((provider) => Tab(
                              child: Text(
                                provider.categoryName,
                                style: headerTextStyle.copyWith(
                                  color:headerTextColor
                                ),

                              ),
                            ))
                        .toList()),
                // wrap with gesture detector and see if it work to open the search delegate
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //   height: 50,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     border: Border.all(color: kBorderColor),
                //   ),
                //   child: Icon(FontAwesomeIcons.search,color: iconColor,),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                     height: MediaQuery.of(context).size.height*.65,
                    child: TabBarView(
                      children: fruitCategoryProvider
                          .map((provider) => ProductList(
                                provider: provider,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final FruitProductCategory provider;

  const ProductList({Key key, this.provider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    provider.intialiseProducts();
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: provider.products
                .map((product) => FruitCard(
                      fruitProduct: product,
                    ))
                .toList()),
      ),
    );
  }
}
