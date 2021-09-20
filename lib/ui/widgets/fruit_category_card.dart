import 'package:dashcast/core/models/Product.dart';
import 'package:dashcast/ui/viewutils/constants.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:flutter/material.dart';
class FruitCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function press;
  final FruitVariety fruitVariety;
  const FruitCategoryCard({
    Key key,
    this.imagePath,
    this.title,
    this.press,
    this.fruitVariety
  }) : super(key: key);

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
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image(
                    image:AssetImage(
                      imagePath,

                    ),
fit:BoxFit.scaleDown ,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:headerTextStyle.copyWith(
                      fontSize: 16
                    ),
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