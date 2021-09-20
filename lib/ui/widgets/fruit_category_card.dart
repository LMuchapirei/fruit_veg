import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/ui/viewutils/constants.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';

class FruitCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function press;
  final FruitVariety fruitVariety;
  const FruitCategoryCard(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.press,
      required this.fruitVariety})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              press();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: headerTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
