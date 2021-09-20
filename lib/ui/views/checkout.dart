import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/views/cart.dart';
import '../../ui/views/myorders.dart';
import '../../ui/viewutils/textutils.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFF0F4F8),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 8,
              child: CustomScrollView(slivers: <Widget>[
                SliverAppBar(
                  leading: InkWell(
                    onTap: () {
                      // navigate back to previous page
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: iconColor,
                    ),
                  ),
                  backgroundColor: Color(0xFFF0F4F8),
                  title: Text(
                    'Checkout',
                    style: headerTextStyle,
                  ),
                  actions: <Widget>[
                    InkWell(
                      onTap: () {
                        print('Pressed on Tap for Cart');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart(),
                            ));
                      },
                      child: Icon(
                        Icons.shopping_cart,
                        color: iconColor,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    // profile placeholder
                    Container(
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
                        backgroundColor: headerTextColor,
                      ),
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            color: iconColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Payment Mode',
                                style: headerTextStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Select your preffered payment mode',
                                style: TextStyle(
                                    fontSize: 12, color: headerTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // this should be loaded from the account ie..the user account should hold a card
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow:
                                    kElevationToShadow[1], //try this one out
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top:15,
                                  left: 20,
                                  child: Icon(FontAwesomeIcons.ccVisa,color:iconColor),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 20,
                                  child: Text(
                                    'CARD NUMBER',
                                    style: TextStyle(
                                        color: headerTextColor, fontSize: 12),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(
                                      '8154 3265 0045 1582',
                                      style: TextStyle(
                                          color: headerTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'EXPIRY DATE',
                                        style: TextStyle(
                                            color: headerTextColor,
                                            fontSize: 12),
                                      ),
                                     
                                          Text('07/21',
                                          style: TextStyle(
                                              color: headerTextColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  right: 20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                 
                                     
                                       Text('CVV',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: headerTextColor)),
                                      Text('007',
                                          style: TextStyle(
                                              color: headerTextColor,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Text(
                                  'Or Checkout with',
                                  style: TextStyle(
                                      fontSize: 12, color: headerTextColor),
                                ),
                           ),


                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.horizontal(

                                      left:Radius.circular(20),
                                      right: Radius.circular(20)
                                    )
                                  ),
                                  child: Center(child: RichText(
                                     text: TextSpan(
                                       text: "Pay",
                                       style: TextStyle(
                                         color: Colors.blue
                                       ),
                                       children: [
                                         TextSpan(
                                           text:"Now",
                                           style: TextStyle(
                                             color:Colors.lightBlue
                                           )
                                         )
                                       ]
                                     ),
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.horizontal(

                                      left:Radius.circular(20),
                                      right: Radius.circular(20)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.applePay,size: 16,),
                                      SizedBox(width:10),
                                      RichText(
                                         text: TextSpan(
                                           text: "Apple",
                                           style: TextStyle(
                                             color: Colors.blue
                                           ),
                                           children: [
                                             TextSpan(
                                               text:"Pay",
                                               style: TextStyle(
                                                 color:Colors.lightBlue
                                               )
                                             )
                                           ]
                                         ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.horizontal(

                                      left:Radius.circular(20),
                                      right: Radius.circular(20)
                                    )
                                  ),
                                  child: Center(child: RichText(
                                     text: TextSpan(
                                       text: "Eco",
                                       style: TextStyle(
                                         color: Colors.red
                                       ),
                                       children: [
                                         TextSpan(
                                           text:"Cash",
                                           style: TextStyle(
                                             color:Colors.lightBlue
                                           )
                                         )
                                       ]
                                     ),
                                  ),),
                              ),
                               ),
                                Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.horizontal(

                                      left:Radius.circular(20),
                                      right: Radius.circular(20)
                                    )
                                  ),
                                  child: Center(child: Text(
                                    'Payement On Delivery'
                                  ),),
                              ),
                               ),
                                InkWell(
                                  onTap: () {
                                    // navigate to my orderpage
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOrders(),));
                                  },
                                                                  child: Container(
                                  width: 250,
                                  height: 40,
                                 
                                  decoration: BoxDecoration(
                                    color: iconColor,
                                    borderRadius: BorderRadius.horizontal(

                                      left:Radius.circular(20),
                                      right: Radius.circular(20)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Confirm Payment",
                                        style:TextStyle(color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right:8.0),
                                        child: Text("\$55.76",
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontWeight: FontWeight.w500
                                        ),),
                                      )
                                    ],
                                  ),
                              ),
                                ),
                        ],
                      ),
                    )
                  ]),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
