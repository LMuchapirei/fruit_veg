import 'package:dashcast/core/models/Product.dart';
import 'package:flutter/material.dart';

class VegetableDetails extends StatelessWidget {
  final Product product;
  final Variety variety;

  const VegetableDetails({Key key, this.product, this.variety}) : super(key: key);

  String generateFacts(){
    var fact='';
    switch(variety){
      case Variety.Leafy_Green:
      fact='Leafy vegetable include lettuce, spinach and other silcerbeet also including local vegetables such as covo viscos etc\nGreen leafy vegetables ensure beautiful skin and hair. Vegetables such collards and kale are rich in calcium, which ensure strong teeth and bones. Antioxidants such as vitamin C, lutein, and zeaxanthin in greens reduce the risk of cataracts and muscular degeneration.';
      break;
      case Variety.Cruciferous:
      fact="Most cruciferous veggies are rich in vitamins and minerals such as folate and vitamin K. Dark green cruciferous veggies also are an excellent source of vitamins A and C. They're also rich in phytonutrients — plant-based compounds that may help to lower inflammation and reduce the risk of developing cancer";
      break;
      case Variety.Allium:
      fact="There is nary a cuisine that doesn’t include allium vegetables. Onions, garlic, leeks, shallots, and scallions are all members of the Allium genus and are fundamental to so many dishes that cooking.Garlic (Allium sativum) is used as a flavoring ingredient in food preparations and promoted as a DS for patients with hypertension and hyperlipidemia, and for preventing cardiovascular disease. Garlic is used to prevent various cancers, including colorectal, gastric, breast, and prostate cancers.";
      break;
      case Variety.Marrow:
      fact="Marrow – pumpkin, cucumber and zucchini provides variety of benefits.";
      break;
      case Variety.Root:
      fact="Root vegetables are especially rich in soluble and insoluble fibre, which helps to boost the health of gut bacteria, lower high levels of blood fats and blood glucose, and reduce the risk of Type-2 diabetes, heart disease and bowel cancer";
      break;
      case Variety.Stem:
      fact="Unlike other veggies in your crisper, stem vegetables have the unique advantage of being almost entirely edible. (No de-seeding, skinning, or peeling necessary!) “Stem vegetables are very well known for being entirely edible and not having to get rid of anything,These include celery and asparagus";
      break;
    }
    return fact;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF399D63)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white
                ),
                ),

              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0, left: MediaQuery.of(context).size.width - 60.0
                ),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xFF4DA774),
                  mini: true,
                  elevation: 0.0,
                  child: Icon(Icons.shopping_cart,
                      color: Colors.white, size: 15.0),
                ),
              ),
              Positioned(
                top: 10.0,
                left: MediaQuery.of(context).size.width - 30.0,
                child: Container(
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.white
                  ),
                  child: Center(
                    // this should be linked to the number of items in cart
                    child: Text(
                      '1',
                      style: TextStyle(color: Color(0xFF399D63),
                      fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.variety.toString().substring(8),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'FROM',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'SIZES',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4)),
                    ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:[
                        Text(
                      'Small',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                     Text(
                      'Medium',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                     Text(
                      'Large',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                     Text(
                      'ExtraLarge',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                     ]
                   ),
                    SizedBox(height: 10.0),
                  Row(
                    
                    children: [
                      Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.black),
                      child: Center(
                        child: Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                      Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.black),
                      child: Center(
                        child: Icon(Icons.favorite, color: Colors.white),
                      ),
                    )
                  ],)
                  ],
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 185.0,
                left: (MediaQuery.of(context).size.width / 2) - 80.0,
                child: Image(
                  image: AssetImage('assets/whiteplant.png'),
                  fit: BoxFit.cover,
                  height: 250.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 275.0,
                      left: 20.0,
                      right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'What yu need to know...',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                         generateFacts(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Details',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Plant height: 35-45cm;',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        'Nursery pot width: 12cm',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}