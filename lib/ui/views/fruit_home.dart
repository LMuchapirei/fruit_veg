import 'package:fruit_veg/core/viewmodels/notifiers/fruit_products_notifier.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:fruit_veg/ui/widgets/fruit_category_card.dart';
import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fruits_home.dart';

class FruitsHome extends StatefulWidget {
  @override
  _FruitsHomeState createState() => _FruitsHomeState();
}

class _FruitsHomeState extends State<FruitsHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          body: ListView(
            children: [
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
                      Text(
                        'Fruits',
                        style: headerTextStyle.copyWith(fontSize: 20),
                      ),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        mini: true,
                        elevation: 0.0,
                        child: Icon(
                          FontAwesomeIcons.search,
                          color: iconColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: fruitCategory
                      .map((category) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => FruitsCurrentVariety(
                                        fruitVariety: category.variety,
                                        categoryName: category.categoryName,
                                      )));
                            },
                            child: FruitCategoryCard(
                              imagePath: category.imagePath,
                              title: category.categoryName,
                              fruitVariety: category.variety,
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<FruitData> fruitCategory = [
  FruitData(
    categoryName: "Berries",
    imagePath: "assets/images/fruits/strawberry.jpg",
    variety: FruitVariety.Berries,
  ),
  FruitData(
      categoryName: "Citrus",
      imagePath: "assets/images/fruits/oranges.jpg",
      variety: FruitVariety.Citrus),
  FruitData(
      categoryName: "Melons",
      imagePath: "assets/images/fruits/melons.jpg",
      variety: FruitVariety.Melons),
  FruitData(
      categoryName: "Stone Fruit",
      imagePath: "assets/images/fruits/peaches.jpg",
      variety: FruitVariety.Stone_Fruit),
  FruitData(
      categoryName: "Tropical",
      imagePath: "assets/images/fruits/banana.jpg",
      variety: FruitVariety.Tropical),
  FruitData(
      categoryName: "Apples and Pears",
      imagePath: "assets/images/fruits/apples.jpg",
      variety: FruitVariety.Apples),
  FruitData(
      categoryName: "Tomatoes and Avocados",
      imagePath: "assets/images/fruits/avocados.jpg",
      variety: FruitVariety.Miscelaneous)
];
