import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/brand_model.dart';
import 'package:fruit_veg/ui/views/brands_home.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;

  const BrandCard({Key? key, required this.brand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BrandHome(
                  brand: brand,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          height: height * .2,
          width: MediaQuery.of(context).size.width * .4,
          child: Stack(
            children: [
              Container(
                height: 80,
                width: (width / 2),
                decoration: BoxDecoration(
                    color: brand.brandThemeColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(brand.brandName),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(brand.brandName), //we also need a logo
                        Row(
                          children: [
                            Text('8 Products'),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(brand.rating.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
