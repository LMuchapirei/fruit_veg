import 'package:fruit_veg/core/models/user_model.dart';
import 'package:fruit_veg/core/viewmodels/notifiers/userData_notifier.dart';
import 'package:fruit_veg/ui/widgets/address_details.dart';
import 'package:fruit_veg/ui/widgets/edit_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/UserModel.dart';
import '../../ui/views/cart.dart';
import '../../ui/views/myorders.dart';
import '../../ui/views/wishlist.dart';
import '../../ui/viewutils/textutils.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Gender genderSetting = Gender.Male;

  Future<User?> _getUserDetails(BuildContext context) async {
    User? user = await showDialog<User>(
      context: context,
      builder: (context) => Dialog(
        child: EditProfileDialog(),
      ),
    );
    return user;
  }

  Future<AddressDetails> _getAddressDetails(BuildContext context) async {
    AddressDetails addressDetails = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: EditAddressDialog(),
            ));
    return addressDetails;
  }

  void _navigateToMyOrders(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyOrders()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Userdata>(
      builder: (context, userData, child) => Container(
          child: Scaffold(
        backgroundColor: Color(0xFFF0F4F8),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      color: iconColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      "Account",
                      style: headerTextStyle,
                    ),
                    actions: <Widget>[
                      Row(
                        children: <Widget>[
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
                          Container(
                            width: 25,
                            height: 25,
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
                              backgroundColor: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    userData.user!.user.fullName,
                                    style: headerTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      userData.user!.user.emailAdress,
                                      style: TextStyle(
                                          fontSize: 12, color: iconColor),
                                    ),
                                  )
                                ],
                              ),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 300,
                          height: 60,
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => WishList(),
                                    ));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite_border,
                                        color: headerTextColor,
                                      ),
                                      Text(
                                        'WishList',
                                        style: accountText1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star_border,
                                        color: headerTextColor,
                                      ),
                                      Text(
                                        'Following',
                                        style: accountText1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    // TODO: Navigate to th messages tab
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.message,
                                        color: headerTextColor,
                                      ),
                                      Text(
                                        'Message',
                                        style: accountText1,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 300,
                          height: 250,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.view_compact,
                                          color: headerTextColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'My Orders',
                                          style: TextStyle(
                                              color: headerTextColor,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyOrders()));
                                        },
                                        child: Text(
                                          'View all',
                                          style: accountText1,
                                        ))
                                  ],
                                ),
                                InkWell(
                                  onTap: () => _navigateToMyOrders,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Unpaid",
                                        style: accountText2,
                                      ),
                                      Chip(
                                        label: Text(
                                            userData.unpaid.length.toString()),
                                        backgroundColor: Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _navigateToMyOrders(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "To be shipped",
                                        style: accountText2,
                                      ),
                                      Chip(
                                        label: Text(
                                            userData.toShip.length.toString()),
                                        backgroundColor: Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _navigateToMyOrders(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Shipped",
                                        style: accountText2,
                                      ),
                                      Chip(
                                        label: Text(
                                            userData.shipped.length.toString()),
                                        backgroundColor: Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _navigateToMyOrders(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "In dispute",
                                        style: accountText2,
                                      ),
                                      Chip(
                                        label: Text("1"),
                                        backgroundColor: Colors.grey.shade200,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 300,
                          height: 180,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.person_outline,
                                            color: headerTextColor,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Profile Settings',
                                            style: TextStyle(
                                                color: headerTextColor,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            // show dialog to edit the profile settings
                                            // todo finish off this function
                                            var user =
                                                await _getUserDetails(context);
                                            // print(user.birthDate+"  "+user.emailAdress+" another one");
                                            userData.resetUser(user!);
                                          },
                                          child: Text(
                                            'Edit',
                                            style: accountText1,
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Full name",
                                          style: accountText2,
                                        ),
                                        Text(userData.user!.user.fullName,
                                            style: accountText3),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Email",
                                          style: accountText2,
                                        ),
                                        Text(userData.user!.user.emailAdress,
                                            style: accountText3)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Telephone",
                                          style: accountText2,
                                        ),
                                        Text(userData.user!.phoneNumber,
                                            style: accountText3),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Gender",
                                          style: accountText2,
                                        ),
                                        Text(userData.user!.user.genderGetter,
                                            style: accountText3),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Birth Date",
                                          style: accountText2,
                                        ),
                                        Text(userData.user!.user.birthDate,
                                            style: accountText3),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          elevation: 10,
                          child: Container(
                            width: 300,
                            height: 180,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_city,
                                              color: headerTextColor,
                                            ),
                                            Text('Address Details',
                                                style: TextStyle(
                                                    color: headerTextColor,
                                                    fontSize: 14))
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () async {
                                              var addressStuff =
                                                  await _getAddressDetails(
                                                      context);
                                              userData.resetAddressData(
                                                  addressStuff);
                                            },
                                            child: Text(
                                              'Edit',
                                              style: accountText1,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Address',
                                          style: accountText2,
                                        ),
                                        Text(
                                          userData.user!.address1,
                                          style: accountText3,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'City',
                                          style: accountText2,
                                        ),
                                        Text(
                                          userData.user!.city,
                                          style: accountText3,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Postal Code',
                                          style: accountText2,
                                        ),
                                        Text(
                                          userData.user!.postCode,
                                          style: accountText3,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Country',
                                          style: accountText2,
                                        ),
                                        Text(
                                          userData.user!.country,
                                          style: accountText3,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Region/Province',
                                          style: accountText2,
                                        ),
                                        Text(
                                          userData.user!.region,
                                          style: accountText3,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        )),
      )),
    );
  }
}
