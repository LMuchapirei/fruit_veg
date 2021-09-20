import 'package:clay_containers/clay_containers.dart';
import 'package:fruit_veg/core/models/Product.dart';
import 'package:fruit_veg/core/models/brand_model.dart';
import 'package:fruit_veg/core/models/review_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/brand_notifier.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/product_notifier.dart';
import 'package:fruit_veg/ui/views/productpage.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';
import 'package:fruit_veg/ui/widgets/product_card.dart';
import 'package:fruit_veg/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BrandHome extends StatefulWidget {
  final Brand brand;

  const BrandHome({Key? key, required this.brand}) : super(key: key);

  @override
  _BrandHomeState createState() => _BrandHomeState();
}

class _BrandHomeState extends State<BrandHome> {
  bool scroll = true;
  @override
  Widget build(BuildContext context) {
    print(widget.brand.brandName);
    // TODO:continue here
    final currentBrandNotifier = [];
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder: (context, scroll) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Color(0xFF38BEC9),
                    // title: Text(widget.brand.brandName),
                    actions: [
                      IconButton(
                        onPressed: () async {
                          // search stuff put in app
                          Product? result = await showSearch(
                              context: context,
                              delegate: ProductSearch(brand: widget.brand));
                          if (result != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(product: result),
                            ));
                          }
                        },
                        icon: Icon(Icons.search),
                      )
                    ],
                    pinned: true,
                    floating: false,
                    expandedHeight: 250,
                    automaticallyImplyLeading: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Stack(
                            children: [
                              BackLay(),
                              BackLayB(
                                brandName: widget.brand.brandName,
                              )
                            ],
                          )),
                          Container(height: 20, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                          minHeight: 40,
                          maxHeight: 60,
                          child: TabBar(
                            labelColor: Colors.black87,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.transparent,
                            tabs: [
                              Tab(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(20),
                                            right: Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 16,
                                          left: 16,
                                          top: 12,
                                          bottom: 12),
                                      child: Text("Home"),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(20),
                                            right: Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 16,
                                          left: 16,
                                          top: 12,
                                          bottom: 12),
                                      child: Text("Products"),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(20),
                                            right: Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 16,
                                          left: 16,
                                          top: 12,
                                          bottom: 12),
                                      child: Text("Reviews"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )))
                ];
              },
              body: TabBarView(children: [
                Home(
                  brand: widget.brand,
                ),
                Products(
                  brand: widget.brand,
                ),
                Reviews(),
              ]))),
    );
  }
}

class BackLay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      color: Color(0xFF38BEC9),
      // put some image and a marketing thing in the background
    );
  }
}

class BackLayB extends StatelessWidget {
  final String brandName;

  const BackLayB({Key? key, required this.brandName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Color(0xFF38BEC9),
      child: Center(
        // put the brand log in
        child: Text(
          brandName,
          style: headerTextStyle.copyWith(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class Home extends StatelessWidget {
  final Brand brand;

  const Home({Key? key, required this.brand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(brand.brandName);
    final brandProvider = Provider.of<BrandsNotifier>(context);
    final brandList = brandProvider.brandsProvider;
    final brandObject =
        brandList.where((element) => element.brand == brand).toList()[0];
    final featuredProducts = brandObject.products
        .where((element) => element.brand
            .toLowerCase()
            .contains(brandObject.brand.brandName.toLowerCase()))
        .toList();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flexible(),
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Description',
                            style: headerTextStyle.copyWith(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(brand.brandDescription,
                        style: headerTextStyle.copyWith(fontSize: 14))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_shopping_cart,
                  color: iconColor,
                ),
                SizedBox(width: 15),
                Text(
                  'Featured Products',
                  style: headerTextStyle.copyWith(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: (featuredProducts.isEmpty)
                      ? [
                          ClayContainer(
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.sadCry,
                                    color: iconColor,
                                    size: 40,
                                  ),
                                  Text(
                                    'No products in stock for this brand.Coming Soon',
                                    style:
                                        headerTextStyle.copyWith(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]
                      : featuredProducts
                          .map((product) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ProductCard(
                                  product: product,
                                  discount: product.discount,
                                ),
                              ))
                          .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 2,
              child: ClayContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.link, color: iconColor),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Product Links',
                            style: headerTextStyle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                      Text('For mor')
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  final Brand brand;

  const Products({Key? key, required this.brand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final brandProducts = myList
        .where((products) => products.brand
            .toLowerCase()
            .contains(brand.brandName.toLowerCase()))
        .toList();
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Flexible(
              flex: 2,
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.productHunt, color: iconColor),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    brand.brandName + "  Products",
                    style: headerTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 9,
            child: ListView(
              children: (brandProducts.isEmpty)
                  ? [
                      ClayContainer(
                        child: Center(
                          child: Text(
                            'No products in stock for this brand.Coming Soon',
                            style: headerTextStyle.copyWith(fontSize: 40),
                          ),
                        ),
                      )
                    ]
                  : brandProducts
                      .map((product) => ClayContainer(
                            width: double.infinity,
                            spread: 10,
                            depth: 10,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          ProductPage(product: product)));
                                },
                                subtitle: Text('${product.sales} Sales'),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(product.imagePath),
                                  radius: 30,
                                  child: Text(
                                    product.name[0],
                                    style:
                                        headerTextStyle.copyWith(fontSize: 18),
                                  ),
                                ),
                                title: Text(
                                  product.name,
                                  style: headerTextStyle,
                                ),
                                trailing: Column(
                                  children: [
                                    ReviewChip(
                                      discount: product.rating,
                                    ),
                                    Text(
                                      "\$" + product.price.toString(),
                                      style: headerTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
            ),
          )
        ],
      ),
    ));
  }
}

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: reviews
            .map((review) => ReviewItem(
                  userReview: review,
                ))
            .toList(),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate<Product> {
  final Brand brand;

  ProductSearch({required this.brand});
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Product(
                imagePath: 'imagePath',
                name: 'name',
                variety: Variety.Cruciferous,
                price: 12,
                barCode: 'barCode',
                sales: 12,
                rating: 4,
                brand: '',
                costPerKilo: 0.0,
                description: '',
                discount: 0.0,
                leftInStock: 0,
                maxWeight: 0.0));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = myList
        .where((product) =>
            product.brand.toLowerCase().contains(brand.brandName.toLowerCase()))
        .toList();
    final searchResults = results
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView(
        children: (query.isEmpty)
            ? []
            : searchResults
                .map((product) => Container(
                        child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Text(
                            product.name[0],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                      title: Text(product.name),
                      subtitle: Text(product.description),
                      trailing: Text(product.price.toString()),
                      onTap: () {
                        close(context, product);
                      },
                    )))
                .toList());
  }

  //we are allowed to use streambuilders also
  @override
  Widget buildSuggestions(BuildContext context) {
    final results = myList
        .where((product) =>
            product.brand.toLowerCase().contains(brand.brandName.toLowerCase()))
        .toList();
    final searchResults = results
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView(
      children: (query.isEmpty)
          ? []
          : searchResults
              .map((product) => Container(
                      child: ListTile(
                    title: Text(product.name),
                    trailing: Text(product.price.toString()),
                    onTap: () {
                      close(context, product);
                    },
                  )))
              .toList(),
    );
  }
}
