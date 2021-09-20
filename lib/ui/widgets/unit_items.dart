import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:provider/provider.dart';

class UnitItem extends StatefulWidget {
  final UnitProductFruit unitProductFruit;
  final UnitProductVegetable unitProductVegetable;
  const UnitItem(
      {Key? key,
      required this.unitProductFruit,
      required this.unitProductVegetable})
      : super(key: key);
  @override
  _UnitItemState createState() => _UnitItemState();
}

const TextStyle subtitleStyle =
    TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600);

class _UnitItemState extends State<UnitItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartNotifier>(context);
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
        title: widget.unitProductFruit != null
            ? Text(
                '${widget.unitProductFruit.name}',
                style: headerTextStyle.copyWith(color: Colors.black),
              )
            : widget.unitProductVegetable != null
                ? Text('${widget.unitProductVegetable.name}',
                    style: headerTextStyle.copyWith(color: Colors.black))
                : Text('Not Available'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Total'),
                widget.unitProductFruit != null
                    ? Text(
                        '\$${widget.unitProductFruit.unitCost * widget.unitProductFruit.quantity}',
                        style: subtitleStyle)
                    : widget.unitProductVegetable != null
                        ? Text(
                            '\$${widget.unitProductVegetable.unitCost * widget.unitProductVegetable.quantity}',
                            style: subtitleStyle)
                        : Text('Not Available', style: subtitleStyle)
              ],
            ),
            Column(
              children: [
                Text('Rating'),
                widget.unitProductFruit != null
                    ? Text('⭐${widget.unitProductFruit.rating}',
                        style: subtitleStyle)
                    : widget.unitProductVegetable != null
                        ? Text('⭐${widget.unitProductVegetable.rating}',
                            style: subtitleStyle)
                        : Text('Not Available', style: subtitleStyle)
              ],
            ),
            Column(
              children: [
                Text('UnitPrice'),
                widget.unitProductFruit != null
                    ? Text('${widget.unitProductFruit.unitCost}',
                        style: subtitleStyle)
                    : widget.unitProductVegetable != null
                        ? Text('\$${widget.unitProductVegetable.unitCost}',
                            style: subtitleStyle)
                        : Text('Not Available', style: subtitleStyle)
              ],
            ),
            Column(
              children: [
                Text('Variety'),
                widget.unitProductFruit != null
                    ? Text(
                        '${widget.unitProductFruit.variety.toString().substring(13)}',
                        style: subtitleStyle)
                    : widget.unitProductVegetable != null
                        ? Text(
                            '${widget.unitProductVegetable.variety.toString().substring(8)}',
                            style: subtitleStyle)
                        : Text('Not Available', style: subtitleStyle)
              ],
            ),
          ],
        ),
        trailing: cartProvider.containsUnitFruit(widget.unitProductFruit) ||
                cartProvider.containsUnitVeges(widget.unitProductVegetable)
            ? Container(
                width: width * .15,
                height: height * .05,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: height * .05,
                        width: width * .15 / 3,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                            )),
                        child: InkWell(
                            onTap: () {
                              //  test
                              if (widget.unitProductFruit != null) {
                                cartProvider.removeUnitProductFruit(
                                    widget.unitProductFruit);
                              } else {
                                if (widget.unitProductVegetable != null) {
                                  cartProvider.removeUnitProductVeges(
                                      widget.unitProductVegetable);
                                }
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ))),
                    Container(
                      height: height * .05,
                      width: width * .15 / 3,
                      color: Colors.white54,
                      child: Center(
                        child: (widget.unitProductFruit != null)
                            ? Text(
                                '${cartProvider.currentUnitFruitCount(widget.unitProductFruit)}',
                                style: TextStyle(color: Colors.black),
                              )
                            : (widget.unitProductVegetable != null)
                                ? Text(
                                    '${cartProvider.currentUnitVegeCount(widget.unitProductVegetable)}',
                                    style: TextStyle(color: Colors.black),
                                  )
                                : Text('0'),
                      ),
                    ),
                    Container(
                        height: height * .05,
                        width: width * .15 / 3,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(20),
                            )),
                        child: InkWell(
                            onTap: () {
                              if (widget.unitProductFruit != null) {
                                cartProvider.addUnitFruitProduct(
                                    widget.unitProductFruit);
                              } else {
                                if (widget.unitProductVegetable != null) {
                                  cartProvider.addUnitProductVegetable(
                                      widget.unitProductVegetable);
                                }
                              }
                            },
                            child: Icon(Icons.add, color: Colors.white))),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  if (widget.unitProductFruit != null) {
                    cartProvider.addUnitFruitProduct(widget.unitProductFruit);
                  } else {
                    if (widget.unitProductVegetable != null)
                      cartProvider
                          .addUnitProductVegetable(widget.unitProductVegetable);
                  }
                },
                child: Container(
                  width: width * .15,
                  height: height * .05,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
