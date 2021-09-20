import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/views/login_screen.dart';
import 'core/viewmodels/notifiers/brand_notifier.dart';
import 'core/viewmodels/notifiers/cart_notifier.dart';
import 'core/viewmodels/notifiers/fruit_products_notifier.dart';
import 'core/viewmodels/notifiers/product_notifier.dart';
import 'core/viewmodels/notifiers/userData_notifier.dart';
import 'core/viewmodels/notifiers/wishlist_notifier.dart';

// void main()=>runApp(
//   ChangeNotifierProvider<CartModel>(
//     builder: (context) => CartModel(),
//     child: MyApp(),
//   ));

void main() => runApp(MultiProvider(
      providers: [
        ListenableProvider<LoadingTabsCount>(
          create: (_) => LoadingTabsCount(),
        ),
        ListenableProvider(
          create: (BuildContext context) {
            return FruitLoadingTabsCount();
          },
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNotifier(
              Provider.of<LoadingTabsCount>(context, listen: false)),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Userdata();
          },
        ),
        ChangeNotifierProvider<BrandsNotifier>(
          create: (context) => BrandsNotifier(),
        ),
        ChangeNotifierProvider(create: (context) => CartNotifier()),
        ChangeNotifierProvider(create: (context) => WishListNotifier()),
        ChangeNotifierProvider(
            create: (
          context,
        ) =>
                FruitProductNotifier(
                    Provider.of<FruitLoadingTabsCount>(context, listen: false)))
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
