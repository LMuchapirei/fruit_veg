import 'package:fruit_veg/core/models/brand_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/brand_notifier.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:fruit_veg/ui/widgets/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsPage extends StatefulWidget {
  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrandsNotifier>(
      builder: (context, brandsProvider, child) => Container(
          child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        leading: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: iconColor,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text(
                          'Brands',
                          style: headerTextStyle,
                        ),
                        centerTitle: true,
                        actions: <Widget>[
                          Row(
                            children: <Widget>[
                              // InkWell(
                              //   onTap: () {
                              //     print('Pressed on Tap for Cart');
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => Cart(),
                              //         ));
                              //   },
                              //   child: Icon(
                              //     Icons.shopping_cart,
                              //     color: iconColor,
                              //     size: 25,
                              //   ),
                              // ),
                              SizedBox(
                                width: 16,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.search,
                                    color: iconColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      SliverGrid.count(
                        crossAxisCount: 2,
                        children: brandsProvider.brandsGetter
                            .map((brand) => BrandCard(
                                  brand: brand,
                                ))
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
