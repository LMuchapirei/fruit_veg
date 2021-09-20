import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart';
import 'package:fruit_veg/ui/views/vegetable_details.dart';

class CategoryList extends StatefulWidget {
  final Variety variety;

  const CategoryList({Key? key, required this.variety}) : super(key: key);
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  initState() {
    super.initState();
    _cruciferous = myList
        .where((element) => element.variety == Variety.Cruciferous)
        .toList();
    _leafyGreen = myList
        .where((element) => element.variety == Variety.Leafy_Green)
        .toList();
    _root = myList.where((element) => element.variety == Variety.Root).toList();
    _alluim =
        myList.where((element) => element.variety == Variety.Allium).toList();
    _stem = myList.where((element) => element.variety == Variety.Stem).toList();
    _marrow =
        myList.where((element) => element.variety == Variety.Marrow).toList();
  }

  List<Product> _leafyGreen = [];
  List<Product> _cruciferous = [];
  List<Product> _root = [];
  List<Product> _alluim = [];
  List<Product> _stem = [];
  List<Product> _marrow = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 370,
          child: _buildListOfProducts(widget.variety),
        ),
      ],
    );
  }

  Widget _buildListOfProducts(Variety category) {
    Widget productListView = Placeholder();
    switch (category) {
      case Variety.Leafy_Green:
        productListView = _buildList(_leafyGreen);
        break;
      case Variety.Cruciferous:
        productListView = _buildList(_cruciferous);
        break;
      case Variety.Root:
        productListView = _buildList(_root);
        break;
      case Variety.Stem:
        productListView = _buildList(_stem);
        break;
      case Variety.Allium:
        productListView = _buildList(_alluim);
        break;
      case Variety.Marrow:
        productListView = _buildList(_marrow);
    }
    return productListView;
  }

  Widget _buildList(List<Product> productList) {
    return productList.length > 0
        ? ListView(
            padding: EdgeInsets.only(left: 25),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var index = 0; index < productList.length; index++)
                _getProductCard(productList[index])
            ],
          )
        : Placeholder();
  }

  Widget _getProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => VegetableDetails(
                  product: product,
                  variety: product.variety,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              height: 325,
              width: 225,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF399D63)),
                // color: const Color(0xFF38BEC9)),
                height: 250,
                width: 225,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FROM',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF8AC7A4)),
                            ),
                            Text(
                              '\$' + product.price.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Image(
                      image: AssetImage(product.imagePath),
                      colorBlendMode: BlendMode.srcOver,
                      color: const Color(0xFF399D63).withOpacity(0.1),
                      height: 155,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              product.brand,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF8AC7A4)),
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     SizedBox(
                    //       width: 25,
                    //     ),
                    //     Container(
                    //       height: 30,
                    //       width: 30,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //             // color: const Color(0xFF8AC7A4),
                    //             color: const Color(0xFF54D1DB),
                    //             style: BorderStyle.solid,
                    //             width: 0.5),
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: const Color(0xFF399D63),
                    //         // color: const Color(0xFF54D1DB),
                    //       ),
                    //       child: Icon(Icons.usb,
                    //           color: Colors.white.withOpacity(0.4), size: 20),
                    //     ),
                    //     SizedBox(width: 15),
                    //     Container(
                    //       height: 30,
                    //       width: 30,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: const Color(0xFF8AC7A4),
                    //             // color: const Color(0xFF54D1DB),
                    //             style: BorderStyle.solid,
                    //             width: 0.5),
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: const Color(0xFF399D63),
                    //         // color: const Color(0xFF54D1DB),
                    //       ),
                    //       child: Icon(Icons.desktop_mac,
                    //           color: Colors.white.withOpacity(0.4), size: 20),
                    //     ),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     Container(
                    //       height: 30,
                    //       width: 30,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: const Color(0xFF8AC7A4),
                    //             style: BorderStyle.solid,
                    //             width: 0.5),
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: const Color(0xFF399D63)
                    //         // color: const Color(0xFF54D1DB),
                    //       ),
                    //       child: Icon(Icons.hdr_strong,
                    //           color: Colors.white.withOpacity(0.4), size: 20),
                    //     ),
                    //     SizedBox(width: 15),
                    //     InkWell(
                    //         onTap: () {},
                    //         child: Container(
                    //           height: 30,
                    //           width: 30,
                    //           decoration: BoxDecoration(
                    //             color: const Color(0xFF399D63),
                    //             // color: const Color(0xFF54D1DB),
                    //           ),
                    //           child: Icon(Icons.help_outline,
                    //               color: Colors.white.withOpacity(0.4),
                    //               size: 20),
                    //         ))
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 56.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // color: Colors.black,
                    color: const Color(0xFF54D1DB),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
