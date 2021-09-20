import 'package:dashcast/core/viewmodels/notifiers/brand_notifier.dart';
import 'package:dashcast/core/viewmodels/notifiers/userData_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/views/login_screen.dart';
import 'core/viewmodels/notifiers/cart_notifier.dart';
import 'core/viewmodels/notifiers/fruit_products_notifier.dart';
import 'core/viewmodels/notifiers/product_notifier.dart';
import 'core/viewmodels/notifiers/wishlist_notifier.dart';




// void main()=>runApp(
//   ChangeNotifierProvider<CartModel>(
//     builder: (context) => CartModel(),
//     child: MyApp(),
//   ));


void main()=>runApp(
  MultiProvider(providers: [
    ListenableProvider<LoadingTabsCount>(
      builder: (_)=>LoadingTabsCount(),
      dispose: (_,value)=>value.dispose(),),
    ListenableProvider(builder: (_)=>FruitLoadingTabsCount(),
    dispose: (_,value)=>value.dispose(), ),
    ChangeNotifierProvider(builder: (context) => ProductNotifier(Provider.of<LoadingTabsCount>(context,listen: false)),),
    ChangeNotifierProvider(builder: (context)=>Userdata(),),
    ChangeNotifierProvider(builder: (context)=>BrandsNotifier(),),
    ChangeNotifierProvider(builder: (context)=>CartNotifier()),
    ChangeNotifierProvider(builder:(context)=>WishListNotifier()),
    ChangeNotifierProvider(
      builder: (context,)=>FruitProductNotifier(Provider.of<FruitLoadingTabsCount>(context,listen: false)))
  ],
  child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginScreen())
    ;
  }
}