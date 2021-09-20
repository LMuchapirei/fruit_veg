import 'package:dashcast/core/models/order.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:dashcast/ui/viewutils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailPage extends StatefulWidget {
  final Order order;

  const OrderDetailPage({Key key, this.order}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  bool scroll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, scroll) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF87EAF2),
              leading:
                  IconButton(icon: Icon(Icons.arrow_back), onPressed:()=> Navigator.of(context).pop(),),
              pinned: true,
              title: Text(widget.order.product.name),
              floating: false,
              expandedHeight: 250,
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(40))),
              flexibleSpace: FlexibleSpaceBar(
                  background: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Image(
                         fit: BoxFit.cover,
                        image: AssetImage(widget.order.product.imagePath),),
                      Container(
                        width: double.infinity,
                        height: 250,
                        child: Center(
                          child: Text(widget.order.product.name,
                          style: headerTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 20
                          ),),
                        ),
                      )
                    ],
                  )),
                  
                ],
              )),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Row(
              children: [
                Icon(Icons.description),
                Text(
                  'Description',
                  style: headerTextStyle.copyWith(fontSize: 18),
                )
              ],
            ),
            Text(
              widget.order.product.description,
              style: headerTextStyle.copyWith(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Payment Status',style: headerTextStyle.copyWith(fontSize: 18),),
              widget.order.paid?
              Text('Paid',style: headerTextStyle.copyWith(fontSize: 18)):
              Row(
                children: [
                  Text('Not Yet Paid'),
                  SizedBox(
                    width: 10,
                  ),

                  Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                            right:Radius.circular(20),
                            
                          ),
                          color:buttonColor
                        ),
                        child: Center(child: Text('Pay',style: buttonTextStyle,),),
                      ),
                ],
              ),
              // Text(widget.order.paid?'Paid':'Not paid',style: headerTextStyle.copyWith(fontSize: 18),)
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Date Created',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.calendar_today,color: iconColor,size: 18,),
                  Text(dateFormatter(widget.order.dateCreated),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Paymment Date',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.calendar_today,color: iconColor,size: 18,),
                  Text(dateFormatter(widget.order.datePaid),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],),
            widget.order.delivered?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Delivery Date Expected',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.calendar_today,color: iconColor,size: 18,),
                  Text(dateFormatter(widget.order.expectedDeliverydate),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],)
            :Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Delivery On',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.calendar_today,color: iconColor,size: 18,),
                  Text(dateFormatter(widget.order.expectedDeliverydate),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Total Cost exc Shipping',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.monetization_on,color: iconColor,size: 18,),
                  Text(widget.order.itemsCost.toString(),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Tax and Shipping Added',style: headerTextStyle.copyWith(fontSize: 18),),Row(
                children: [
                  Icon(Icons.monetization_on,color: iconColor,size: 18,),
                  Text(widget.order.totalCost.toString(),style: headerTextStyle.copyWith(fontSize: 15),),
                ],
              )
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Flexible(flex:2,
                child: GestureDetector(
                  onTap: () {
                    //handle another order
                  },
                                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right:Radius.circular(20)
                      ),
                      color: buttonColor
                    ),
                    child: Center(child: Text('Order Another',style: buttonTextStyle,),),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Flexible(flex:2,
                child: GestureDetector(
                  onTap: () {
                    // handle review
                  },
                                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right:Radius.circular(20),
                        
                      ),
                      color:buttonColor
                    ),
                    child: Center(child: Text('Write Review',style: buttonTextStyle,),),
                  ),
                )),
            ],),
            Text('Share',style: headerTextStyle.copyWith(fontSize: 16),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(FontAwesomeIcons.google), onPressed: (){
                  //handle sharing platforms maybe using intents
                }),
                IconButton(icon: Icon(FontAwesomeIcons.facebook), onPressed: (){
                  //handle sharing platforms maybe using intents
                }),
                IconButton(icon: Icon(FontAwesomeIcons.instagram), onPressed: (){
                  //handle sharing platforms maybe using intents
                })
            ],)
          ]),
        ),
      ),
    );
  }
}
