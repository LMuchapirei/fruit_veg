import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruit_veg/ui/views/fruits_home.dart';
import 'package:fruit_veg/ui/views/productpage.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import '../../core/models/Product.dart';

class WishItemList extends StatelessWidget {
  final Product product;
  WishItemList({required this.product});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(
                  product: product,
                )));
      },
      child: ClayContainer(
        width: width,
        height: 90,
        // spread: 10,
        // depth: 10,
        color: Colors.white,
        child: ListTile(
          title: Text(
            product.name,
            style: headerTextStyle,
          ),
          leading: Container(
            width: width * .15,
            height: 60,
            color: Colors.grey,
            child: Image(image: AssetImage(product.imagePath)),
          ),
          trailing: Text(
            "\$" + product.price.toString(),
            style: headerTextStyle.copyWith(fontSize: 20),
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                product.sales.toString() + " Sales",
                style: headerTextStyle.copyWith(fontSize: 14),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Text(
                    product.rating.toString(),
                    style: headerTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WishItemGrid extends StatelessWidget {
  final Product product;

  const WishItemGrid({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final paddingConst = 20.0;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(
                  product: product,
                )));
      },
      child: ClayContainer(
        width: width / 2 - 2 * paddingConst,
        height: height * .25,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                flex: 6,
                child: Container(
                    child: Image(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.fill,
                ))),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: headerTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "\$" + product.price.toString(),
                        style: headerTextStyle.copyWith(fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.sales.toString() + " Sales",
                            style: headerTextStyle.copyWith(fontSize: 14),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                product.rating.toString(),
                                style: headerTextStyle.copyWith(fontSize: 14),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class WishItemListFruit extends StatelessWidget {
  final FruitProduct product;
  WishItemListFruit({required this.product});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FruitCard(
                  fruitProduct: product,
                )));
      },
      child: ClayContainer(
        width: width,
        height: 90,
        // spread: 10,
        // depth: 10,
        color: Colors.white,
        child: ListTile(
          title: Text(
            product.name,
            style: headerTextStyle,
          ),
          leading: Container(
            width: width * .15,
            height: 60,
            color: Colors.grey,
            child: Image(image: AssetImage(product.imagePath)),
          ),
          trailing: Text(
            "\$" + product.price.toString(),
            style: headerTextStyle.copyWith(fontSize: 20),
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                product.sales.toString() + " Sales",
                style: headerTextStyle.copyWith(fontSize: 14),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Text(
                    product.rating.toString(),
                    style: headerTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WishItemFruitGrid extends StatelessWidget {
  final FruitProduct product;

  const WishItemFruitGrid({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final paddingConst = 20.0;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FruitCard(
                  fruitProduct: product,
                )));
      },
      child: ClayContainer(
        width: width / 2 - 2 * paddingConst,
        height: height * .25,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                flex: 6,
                child: Container(
                    child: Image(
                  image: AssetImage(product.imagePath),
                  fit: BoxFit.fill,
                ))),
            SizedBox(
              height: 10,
            ),
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: headerTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "\$" + product.price.toString(),
                        style: headerTextStyle.copyWith(fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.sales.toString() + " Sales",
                            style: headerTextStyle.copyWith(fontSize: 14),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                product.rating.toString(),
                                style: headerTextStyle.copyWith(fontSize: 14),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
