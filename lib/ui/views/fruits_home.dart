import 'package:clay_containers/widgets/clay_container.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/fruit_products_notifier.dart';
import 'package:fruit_veg/ui/views/cart.dart';
import 'package:fruit_veg/ui/viewutils/constants.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FruitsCurrentVariety extends StatefulWidget {
  final FruitVariety fruitVariety;
  final String categoryName;

  const FruitsCurrentVariety(
      {Key? key, required this.categoryName, required this.fruitVariety})
      : super(key: key);
  @override
  _FruitsCurrentVarietyState createState() => _FruitsCurrentVarietyState();
}

class _FruitsCurrentVarietyState extends State<FruitsCurrentVariety> {
  @override
  Widget build(BuildContext context) {
    final fruitProvider = Provider.of<FruitProductNotifier>(context);
    FruitProductCategory fruitCategory = FruitProductCategory(
        categoryName: '',
        loadingTabsCount: FruitLoadingTabsCount(),
        fruitCategory: FruitVariety.Miscelaneous); // TODO this may be buggy
    print("Categories length " + fruitProvider.category.length.toString());
    fruitProvider.category.forEach((element) {
      if (element.fruitCategory == widget.fruitVariety) fruitCategory = element;
    });
    return Container(
      child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 36,
                  ),
                  Text("Here are your  \nTasty ${widget.categoryName}",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .7,
              child: fruitCategory.products.isEmpty
                  ? Center(
                      child: Text(
                          'No fruits have been added for the category Refresh Page to Load '),
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: fruitCategory.products
                          .map((fruitProduct) => FruitCard(
                                fruitProduct: fruitProduct,
                              ))
                          .toList(),
                    ),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //insane code
              fruitCategory.refreshCaller();
              setState(() {});
              fruitCategory.refreshCaller();
            },
            child: Icon(Icons.refresh),
            backgroundColor: buttonColor,
          )),
    );
  }
}

class FruitCard extends StatelessWidget {
  final FruitProduct fruitProduct;

  const FruitCard({Key? key, required this.fruitProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  fruitProduct: fruitProduct,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
          // margin: EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.height * 0.7,
          width: 270,
          // color: Colors.red,
          child: Stack(
            children: <Widget>[
              // Food Image
              Positioned(
                top: 10,
                left: 10,
                //interesting
                child: Container(
                  height: 184,
                  width: 184,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(fruitProduct.imagePath),
                    ),
                  ),
                ),
              ),
              // Price
              Positioned(
                right: 20,
                bottom: 20,
                child: Text(
                  "\$${fruitProduct.costPerKilo} per Kilo",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black.withOpacity(.65)),
                ),
              ),
              Positioned(
                top: 201,
                left: 40,
                child: Container(
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        fruitProduct.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        "With facts about product",
                        style: TextStyle(
                          color: kTextColor.withOpacity(.4),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        fruitProduct.description,
                        maxLines: 3,
                        style: TextStyle(
                          color: kTextColor.withOpacity(.65),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        fruitProduct.variety.toString().substring(13),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Common recipes using ${fruitProduct.name}',
                        style: TextStyle(color: kTextColor.withOpacity(.65)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final FruitProduct fruitProduct;

  const DetailsScreen({Key? key, required this.fruitProduct}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double _weight = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: iconColor,
                          )),
                      Text(widget.fruitProduct.name,
                          style: headerTextStyle.copyWith(
                            fontSize:
                                Theme.of(context).textTheme.headline5!.fontSize,
                          )),
                      Opacity(
                        opacity: 0,
                        child: Icon(
                          Icons.menu,
                          color: iconColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.all(6),
                    height: 305,
                    width: 305,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      // color: kSecondaryColor,
                    ),
                    child: Image(
                        width: 305,
                        image: AssetImage(widget.fruitProduct.imagePath))),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Select the weight\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .apply(color: buttonColor),
                            ),
                            TextSpan(
                              text: "Using Slider",
                              style: TextStyle(
                                color: buttonColor.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Cost per kilo \$${widget.fruitProduct.costPerKilo}",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: headerTextColor),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Slider(
                    max: widget.fruitProduct.maxWeight,
                    min: 0,
                    value: _weight,
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text('Total Weight',
                                style: TextStyle(
                                    color: Color(0xFF0E7C86),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              '${_weight.toStringAsPrecision(3)} kg',
                              style: headerTextStyle.copyWith(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Total Cost',
                                style: TextStyle(
                                    color: Color(0xFF0E7C86),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              '\$${(widget.fruitProduct.costPerKilo * _weight).toStringAsPrecision(3)}',
                              style: headerTextStyle.copyWith(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          final cartNotifier =
                              Provider.of<CartNotifier>(context);
                          widget.fruitProduct.weight = _weight;
                          cartNotifier.addFruitProduct(widget.fruitProduct);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 27),
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Add to bag",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .apply(color: Colors.white),
                              ),
                              SizedBox(width: 30),
                              Icon(FontAwesomeIcons.shoppingBag,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cart(),
                              ));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: buttonColor.withOpacity(.26),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(15),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: buttonColor,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.shoppingBag,
                                    color: Colors.white,
                                  )),
                              Positioned(
                                right: 15,
                                bottom: 10,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kWhiteColor,
                                  ),
                                  // this should relfect items in cart
                                  child: Text(
                                    "${Provider.of<CartNotifier>(context).itemsCount}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            color: kPrimaryColor, fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
