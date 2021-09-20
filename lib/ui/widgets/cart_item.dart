import 'package:dashcast/core/viewmodels/notifiers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/domain/media/media.dart';
import '../../core/models/Product.dart';
import '../../ui/viewutils/textutils.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({Key key, this.product}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int countItem=0;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cart, child) => 
           Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.15,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            //Image container
            Positioned(
              top: 5,
              left: 5,
                        child: Container(
                width: 100,
                height: 112,
                color: Colors.blueGrey,
                child: Image(image: AssetImage(
                  widget.product.imagePath,
                ),
                fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 25,
              left: 140,
                        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      color: headerTextColor,
                      fontSize: 14
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$"+widget.product.price.toString(),
                      style: TextStyle(
                          color:headerTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap:() {
                            // handler to add cart item
                            // cart.addProduct(widget.product);
                            //handle special logic for vegetables
                            setState(() {
                              countItem++;
                            });
                          } ,
                          child: Icon(Icons.add_circle_outline,color: iconColor,)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(countItem.toString(),style: TextStyle(
                            color:headerTextColor,
                            fontSize:16
                          ),),
                        ),
                        InkWell(
                          onTap: () {
                            // handler to remove items from the cart
                    
                          },
                          child: Icon(Icons.remove_circle_outline,color: iconColor))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}

// class CartItemFruit extends StatelessWidget {
//   final  FruitProduct fruitProduct;

//   const CartItemFruit({Key key, this.fruitProduct}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:ListTile(
//         leading: Image(
//           image: AssetImage(fruitProduct.imagePath),),
//         title: Text(fruitProduct.name),
//         trailing: Column(
//           children: [
//             Row(children: [
//               Icon(Icons.edit),
//               Icon(Icons.delete)
//             ],),
//             Text("${fruitProduct.costPerKilo*fruitProduct.itemWeight}")
//           ],
//         ),
//         subtitle: Row(children: [
//           Text('Weight'),
//           Text(fruitProduct.itemWeight.toString())
//         ],),
//       )
//     );
//   }
// }


class CartItemFruit extends StatefulWidget {
  final FruitProduct product;
  const CartItemFruit({Key key, this.product}) : super(key: key);

  @override
  _CartItemFruitState createState() => _CartItemFruitState();
}

class _CartItemFruitState extends State<CartItemFruit> {
  int countItem=0;
    Future<double> _changeProductWeight(BuildContext context,double currentWeight) async {
    double weight = await showDialog<double>(
      context: context,
      builder: (context) {
        return ChangeWeightDialog();
      } );
    return weight;

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, cart, child) => 
           Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.15,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            //Image container
            Positioned(
              top: 5,
              left: 5,
                        child: Container(
                width: MediaQuery.of(context).size.width*.25,
                height: MediaQuery.of(context).size.height*.15,
                color: Colors.blueGrey,
                child: Image(image: AssetImage(
                  widget.product.imagePath,
                ),
                fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 25,
              left:MediaQuery.of(context).size.width*.25 +40,
                        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      color: headerTextColor,
                      fontSize: 14
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$${widget.product.itemCost.toString().substring(0,4)}",
                      style: TextStyle(
                          color:headerTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap:() async{
                            // handler to add cart item
                            // cart.addProduct(widget.product);
                            // setState(() {
                            //   countItem++;
                            // });
                            double currentWeight=widget.product.itemWeight;

                            double newWeight=await _changeProductWeight(context,currentWeight);
                            Provider.of<CartNotifier>(context).changeProductWeight(widget.product, newWeight);
                          } ,
                          child: Icon(Icons.edit,color: iconColor,)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(countItem.toString(),style: TextStyle(
                            color:headerTextColor,
                            fontSize:16
                          ),),
                        ),
                        InkWell(
                          onTap: () {
                            // handler to remove items from the cart
                            Provider.of<CartNotifier>(context).removeFruit(widget.product);
                          },
                          child: Icon(Icons.delete,color: iconColor))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}


class ChangeWeightDialog extends StatefulWidget {
  @override
  _ChangeWeightDialogState createState() => _ChangeWeightDialogState();
}

class _ChangeWeightDialogState extends State<ChangeWeightDialog> {
  double val=0;
  @override
  Widget build(BuildContext context) {
    
    return  Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child:Padding(padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text('Select New Weight',style: headerTextStyle,),
                ),
                Slider(value: val, 
                min: 0.0,
                max: 5,
                onChanged: (value){
                   
                     setState(() {
                        val=value;
                     });
                  
                  
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Selected Weight ',
                    style:headerTextStyle),
                    Text(val.toStringAsPrecision(4)+" kg",style: headerTextStyle.copyWith(
                      fontWeight:FontWeight.bold
                    ),)
                  ],
                ),
                ButtonBar(
                  children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      FlatButton(
                          onPressed: () {
                           
                             Navigator.pop(context,val);
                          },
                          child: Text("Save"))
                  ],
                )
              ],
            ),
            )
          ),
        ));
  }
}