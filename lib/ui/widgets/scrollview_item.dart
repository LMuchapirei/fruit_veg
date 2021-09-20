import 'package:flutter/material.dart';
import 'package:fruit_veg/ui/views/unit_products_home.dart';
import '../../ui/viewutils/textutils.dart';

enum UnitProductType { Fruit, Vegetables }

// / list should link to a list of special categorised products
// eg desktop setup for a new prgrammer
//TODO: build the collections special page try to use existing widgets
List<ScrollItem> list = [
  ScrollItem(
    buttonText: "View Packed",
    captionText: "Fruits Packed Sold at a unit Price",
    backGroundColor: Color(0xFFBEF8FD),
    unitProductType: UnitProductType.Fruit,
  ),
  ScrollItem(
    buttonText: "Explore Vegetables",
    captionText: "Your favorite vegetables packed at a unit cost",
    backGroundColor: Color(0xFF87EAF2),
    unitProductType: UnitProductType.Fruit,
  ),
  ScrollItem(
    captionText: "Comming Soon",
    buttonText: "Explore",
    backGroundColor: Color(0xFFE0FCFF),
    unitProductType: UnitProductType.Vegetables,
  )
];

class ScrollingImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return list[index];
        });
  }
}

class ScrollItem extends StatelessWidget {
  final String captionText;
  final String buttonText;
  final UnitProductType unitProductType;
  final Color backGroundColor;
  const ScrollItem(
      {Key? key,
      required this.unitProductType,
      required this.captionText,
      required this.buttonText,
      required this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UnitItemsHome(unitProductType: unitProductType),
            ));
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      // get vegetable image
                      unitProductType == UnitProductType.Fruit
                          ? 'assets/images/fruits/apples.jpg'
                          : 'assets/images/fruits/apples.jpg')),
              color: backGroundColor),
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 10,
                  left: 15,
                  child: Text(
                    captionText,
                    style: scrollTextStyle.copyWith(color: Colors.white),
                  )),
              Positioned(
                  bottom: 40,
                  left: 15,
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color(0xFF2CB1BC),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(15),
                            right: Radius.circular(15))),
                    child: Center(
                      child: Text(
                        buttonText,
                        style: buttonTextStyle,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
