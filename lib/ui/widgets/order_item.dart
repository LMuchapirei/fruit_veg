import 'package:clay_containers/clay_containers.dart';
import 'package:dashcast/core/models/order.dart';
import 'package:dashcast/ui/views/orderdetails.dart';
import 'package:dashcast/ui/viewutils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/viewutils/textutils.dart';

class OrderItemList extends StatelessWidget {
  final Order order;

  const OrderItemList({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(order);
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderDetailPage(order: order,)));
      },
          child: Container(
            // this is bad stuff hardcode width and height values gotta fix this
        width: 500,
        height: 90,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            // image container
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 90,
                width: 100,
                color: Colors.grey,
                child: Image(
                  fit:BoxFit.fill,
                  image: AssetImage(order.product.imagePath),),
              ),
            ),

            Positioned(
              top: 10,
              left: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(order.product.name,
                  style: TextStyle(
                    color: headerTextColor
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      // replace icon with proper one
                      Icon(Icons.today,size: 15,color: iconColor),
                      Text(
                        dateFormatter(order.dateCreated),
                        style: TextStyle(fontSize: 12, color: headerTextColor),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // replace icon with the proper one
                      Icon(Icons.calendar_view_day,size: 15,color: iconColor,),
                      Text(
                        order.invoiceCode,
                        style: TextStyle(fontSize: 12, color: headerTextColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 0,
                        child: Column(
                children: <Widget>[
                  Text(
                    '\$${order.product.price}',
                    style: TextStyle(
                        color: headerTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Chip(label: 
                  RichText(
                    text: TextSpan(
                      text: "x",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      children: [
                        TextSpan(
                          text: order.itemsCount.toString(),
                          style: TextStyle(
                            color: Colors.grey
                          )
                        )
                      ]
                    ),
                    
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class OrderItemGrid extends StatelessWidget {
  final Order order;

  const OrderItemGrid({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrderItemCard(
      order:order ,
    );
  }
}



class OrderItemCard extends StatelessWidget {
  final Order order;

  const OrderItemCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final paddingConst = 20.0;
    return GestureDetector(
       onTap: () {
         print(order);
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderDetailPage(order: order,)));
      },
          child: ClayContainer(
        width: width / 2 - 2 * paddingConst,
        height: height * .3,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                flex: 6,
                child: Container(
                    child: Image(
                  image: AssetImage(order.product.imagePath),
                  fit: BoxFit.fill,
                ))),
            SizedBox(height: 10,),
            Flexible(flex:4,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.product.name,style: headerTextStyle.copyWith(fontSize:16),),
                  Text("\$"+order.product.price.toString(),style: headerTextStyle.copyWith(fontSize:15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(order.product.sales.toString()+" Sales",style: headerTextStyle.copyWith(fontSize:14),),
                    Row(children: [
                      Icon(FontAwesomeIcons.star,color: Colors.yellow,),
                      Text(order.product.rating.toString(),style: headerTextStyle.copyWith(fontSize:14),)
                    ],)
                  ],)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
