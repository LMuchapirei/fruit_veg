import 'package:dashcast/core/models/order.dart';
import 'package:dashcast/core/viewmodels/notifiers/userData_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui/viewutils/textutils.dart';
import '../../ui/widgets/order_item.dart';
import 'cart.dart';
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}
// for a user we have orders list with stuff All,UnPaid,Shipped,Due,Issues
class _MyOrdersState extends State<MyOrders> {
  int selected=0;
  Color selectedColor=Color(0xFF38BEC9);
  TextStyle unSelectedStyle=TextStyle(
    color:iconColor
  );
  TextStyle selectedStyle=TextStyle(
    color:Colors.white
  );
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Userdata>(
         builder:(context,userData,child
          )=> DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0xFFF0F4F8),
          body: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: CustomScrollView(
                  slivers: <Widget>[
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
                        'My Orders',
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
                      bottom: TabBar(
                          indicator: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.horizontal(
                              left:Radius.circular(20),
                              right:Radius.circular(20)
                            )
                          ),
                          onTap: (value) {
                            setState(() {
                              selected=value;
                            });
                          },
                          
                          tabs: [
                            Center(child: Text('All',
                            style:(selected==0)?selectedStyle:unSelectedStyle)),
                            Center(child: Text('Unpaid',
                            style:(selected==1)?selectedStyle:unSelectedStyle)),
                            Center(child: Text('Shipped',
                            
                            style:(selected==2)?selectedStyle:unSelectedStyle)),
                            Text('Due',
                            
                            style:(selected==3)?selectedStyle:unSelectedStyle
                            ),
                              
                            Center(child: Text('Issues',
                            style:(selected==4)?selectedStyle:unSelectedStyle))
                          ]),
                    ),
                   
                  ],
                ),
              ),
              Flexible(
                flex: 8,
                child:  TabBarView(
                        children: <Widget>[
                          All(
                            orders:userData.myOrders
                          ),
                          Unpaid(
                            orders:userData.unpaid
                          ),
                          Shipped(
                            orders:userData.shipped
                          ),
                          ToBeShipped(
                            orders:userData.toShip
                          ),
                          InDispute(
                            orders:userData.issues
                          )
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class All extends StatelessWidget {
  final List<Order> orders;

  const All({Key key, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrderListDefaultPage(
      orders:orders
    );
  }
}

class Unpaid extends StatelessWidget {
  final List<Order> orders;

  const Unpaid({Key key, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    orders.forEach((element) {
      print(element);
    });
    return OrderListDefaultPage(
      orders: orders,
    );
  }
}

class Shipped extends StatelessWidget {
  final List<Order> orders;

  const Shipped({Key key, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrderListDefaultPage(
        orders: orders,
    );
  }
}

class ToBeShipped extends StatelessWidget {
  final List<Order> orders;

  const ToBeShipped({Key key, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrderListDefaultPage(
        orders: orders,
    );
  }
}

class InDispute extends StatelessWidget {
  final List<Order> orders;

  const InDispute({Key key, this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrderListDefaultPage(
        orders: orders,
    );
  }
}

class OrderListDefaultPage extends StatefulWidget {
  final List<Order> orders;

  const OrderListDefaultPage({Key key, this.orders}) : super(key: key);
  @override
  _OrderListDefaultPageState createState() => _OrderListDefaultPageState();
}

enum View{
  GRID,
  LIST
}
class _OrderListDefaultPageState extends State<OrderListDefaultPage> {

  View _selectedView=View.GRID;
  Color _selectedViewIconColor=iconColor;
  // List<OrderItemList> _listOfOrderItems=tempOrders.map((order) =>OrderItemList(order: order,)).toList();
  Widget _buildList(){
    return Column(
      children:widget.orders.map((order) =>Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: OrderItemList(order: order,),
      )).toList()
        
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.line_style,color: iconColor,),
                  SizedBox(width: 20,),
                  Text('Orders List',
                  style: headerTextStyle,)
                ],
              ),
              Row(children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedView=View.LIST;
                    });
                  },
                  child: Icon(Icons.list,color: _selectedView==View.LIST?_selectedViewIconColor:Colors.grey,)),
                  SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedView=View.GRID;
                    });
                  },
                  child: Icon(Icons.view_comfy,color: _selectedView==View.GRID?_selectedViewIconColor:Colors.grey,))
              ],)
        ],),
          )),
        Flexible(flex: 8,
        child: CustomScrollView(
          slivers: <Widget>[
            _selectedView==View.LIST?SliverList(delegate: SliverChildListDelegate([
              
              _buildList()
              
            ]),)
            :SliverGrid.count(
              children: <Widget>[
                for (var i = 0; i < widget.orders.length; i++) 
                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: OrderItemGrid(
                  order: widget.orders[i]
              )
                    )     
              ],
              crossAxisCount: 2)
          ],
        ),)
      ],
    );
  }
}