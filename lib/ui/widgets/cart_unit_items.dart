import 'package:dashcast/core/models/Product.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:dashcast/ui/widgets/unit_items.dart';
import 'package:flutter/material.dart';

const trimEnumValueFruits=13;
class CartItemUnitFruit extends StatelessWidget {
  final UnitProductFruit unitProductFruit;

  const CartItemUnitFruit({Key key, this.unitProductFruit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * .15,
       decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 2))),
      child: ListTile(
        leading: Container(
          child: Image(
              height: height * 0.35,
              width: width * 0.15,
              image: AssetImage(
                'assets/images/fruits/banana.jpg',
              )),
        ),
        title: Text(
          '${unitProductFruit.name}',
          style: headerTextStyle.copyWith(color: Colors.black),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Total'),
                Text(
                    '\$${unitProductFruit.unitCost * unitProductFruit.quantity}',
                    style: subtitleStyle)
              ],
            ),
             Column(
                children: [Text('Rating'), 
                Text('⭐${unitProductFruit.rating}',style: subtitleStyle)
                
                ],
              ),
              Column(
                children: [Text('UnitPrice'), 
               
                Text('${unitProductFruit.unitCost}',style: subtitleStyle)
                ]
              ),
              Column(
                children: [Text('Variety'), 
               
                Text('${unitProductFruit.variety.toString().substring(trimEnumValueFruits)}',style: subtitleStyle)
            
                ]),
          ],
        ),
      ),
    );
  }
}

const trimEnumValueVegetables=8;
class CartItemUnitVegetable extends StatelessWidget {
  final UnitProductVegetable unitProductVegetable;

  const CartItemUnitVegetable({Key key, this.unitProductVegetable
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * .15,
       decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 2))),
      child: ListTile(
        
        leading: Container(
          child: Image(
              height: height * 0.35,
              width: width * 0.15,
              image: AssetImage(
                'assets/images/fruits/banana.jpg',
              )),
        ),
        title: Text(
          '${unitProductVegetable.name}',
          style: headerTextStyle.copyWith(color: Colors.black),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Total'),
                Text(
                    '\$${unitProductVegetable.unitCost * unitProductVegetable.quantity}',
                    style: subtitleStyle)
              ],
            ),
             Column(
                children: [Text('Rating'), 
                Text('⭐${unitProductVegetable.rating}',style: subtitleStyle)
                
                ],
              ),
              Column(
                children: [Text('UnitPrice'), 
               
                Text('${unitProductVegetable.unitCost}',style: subtitleStyle)
                ]
              ),
              Column(
                children: [Text('Variety'), 
               
                Text('${unitProductVegetable.variety.toString().substring(trimEnumValueVegetables)}',style: subtitleStyle)
            
                ]),
                   Column(
                children: [Text('Quantity'), 
               
                Text('${unitProductVegetable.quantity}',style: subtitleStyle)
            
                ]),
          ],
        ),
      ),
    );
  }
}
