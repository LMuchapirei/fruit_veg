import 'package:dashcast/core/models/Product.dart';
import 'package:dashcast/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:dashcast/ui/views/account.dart';
import 'package:dashcast/ui/views/cart.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:dashcast/ui/widgets/scrollview_item.dart';
import 'package:dashcast/ui/widgets/unit_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



// Create seperate cart to retrieve products 


class UnitItemsHome extends StatefulWidget {
  final UnitProductType unitProductType;

  const UnitItemsHome({Key key, this.unitProductType}) : super(key: key);
  @override
  _UnitItemsHomeState createState() => _UnitItemsHomeState();
}

class _UnitItemsHomeState extends State<UnitItemsHome> {
  Widget _buildUnitFruits(List<UnitProductFruit> fruits) {
    return Column(
      children: fruits.map((fruit) => UnitItem(
        unitProductFruit: fruit,
      )).toList(),
    );
  }

  Widget _buildUnitVegetables(List<UnitProductVegetable> vegetables) {
    return Column(children: vegetables.map((vegetable) => UnitItem(
      unitProductVegetable: vegetable,
    )).toList());
  }

  @override
  Widget build(BuildContext context) {
    final unitProductType = widget.unitProductType;
    var view;
    final fruits = <UnitProductFruit>[
      UnitProductFruit(
          barCode: "90a87",
        imagePath: "assets/images/blueberries.jpg",
        name: "Apple",
        variety: FruitVariety.Apples,
        description: 'Get From Supplier for more information',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 13,
        rating: 4.4
      ),
       UnitProductFruit(
          barCode: "908a7",
        imagePath: "assets/images/blueberries.jpg",
        name: "Pear",
        variety: FruitVariety.Apples,
        description: 'Get From supplier for more details',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 12,
        rating: 4.4
      ),
       UnitProductFruit(
          barCode: "9087a",
        imagePath: "assets/images/blueberries.jpg",
        name: "Strawberrries",
        variety: FruitVariety.Berries,
        description: 'Get From supplier',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 3,
        rating: 4.4
      ),
       UnitProductFruit(
          barCode: "90a87",
        imagePath: "assets/images/blueberries.jpg",
        name: "Apples",
        variety: FruitVariety.Apples,
        description: 'Get From Supplier for more information',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 13,
        rating: 4.4
      ),
       UnitProductFruit(
          barCode: "908ass7",
        imagePath: "assets/images/blueberries.jpg",
        name: "Pears",
        variety: FruitVariety.Apples,
        description: 'Get From supplier for more details yeah',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 12,
        rating: 4.4
      ),
       UnitProductFruit(
          barCode: "9087aw",
        imagePath: "assets/images/blueberries.jpg",
        name: "Strawberries",
        variety: FruitVariety.Berries,
        description: 'Get From supplier again',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 3,
        rating: 4.4
      ),

    ];
    // these should be fetched from a repository somewhere
    final vegetables = <UnitProductVegetable>[
      UnitProductVegetable(
          barCode: "908asd7",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From manufacture',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 3,
        rating: 4.4
      ),
       UnitProductVegetable(
          barCode: "90dd87",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From manufacture',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 1,
        rating: 4.4
      ),
       UnitProductVegetable(
          barCode: "90qq8723",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From manufacture',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 5,
        rating: 4.4
      ),
          UnitProductVegetable(
          barCode: "908asd733",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From supplier',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 3,
        rating: 4.4
      ),
       UnitProductVegetable(
          barCode: "90dd83327",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From supplier',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 1,
        rating: 4.4
      ),
       UnitProductVegetable(
          barCode: "90qq813ss7",
        imagePath: "assets/images/blueberries.jpg",
        name: "Cabbage",
        variety: Variety.Cruciferous,
        description: 'Get From supplier',
        discount: 10.8,
        sales: 123,
        leftInStock: 56,
        unitCost: 5,
        rating: 4.4
      ),
    ];
    switch (unitProductType) {
      case UnitProductType.Fruit:
        view = SliverList(
          delegate: SliverChildListDelegate([_buildUnitFruits(fruits)]),
        );
        break;
      case UnitProductType.Vegetables:
        view = SliverList(
          delegate: SliverChildListDelegate([_buildUnitVegetables(vegetables)]),
        );
        break;
      default:
        view = Container();
        break;
    }
    final cartProvider=Provider.of<CartNotifier>(context);
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 9,

                      child: CustomScrollView(
              slivers: [
                    SliverAppBar(
                      floating: false,
                      pinned: true,
                      leading: Icon(
                        Icons.list,
                        color: iconColor,
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Text(
                        'Home',
                        style: headerTextStyle,
                      ),
                      centerTitle: true,
                      actions: <Widget>[
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                print('Pressed on Tap for Cart');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cart(),
                                    ));
                              },
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: buttonColor),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: 18.0,
                                        width: 18.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9.0),
                                            color: Colors.white),
                                        child: Center(
                                          // this should be linked to the number of items in cart
                                          child: Text(
                                            '${Provider.of<CartNotifier>(context).itemsCount}',
                                            style: TextStyle(
                                                color: Color(0xFF399D63),
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(Icons.shopping_cart,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Account()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(5.0, 5.0),
                                        blurRadius: 15.0)
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                view,
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: headerTextColor
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left:8.0),
                  child: Container(
                    child: Text(
                      '\$${cartProvider.totalCost.toStringAsPrecision(4)}',
                      style: headerTextStyle.copyWith(
                        fontSize:19,
                        color:Colors.white
                      ) ,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                  Text('VIEW CART(${cartProvider.itemsCount})',
                  style: headerTextStyle.copyWith(
                    color:Colors.white,
                    fontSize:21
                  ),),
                  Icon(Icons.arrow_forward)
                ],)
              ],
            ),
          ))
        ],
      ),
    );
  }
}
