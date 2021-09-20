import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/views/home_screen.dart';
import '../../ui/views/signup_screen.dart';

const PrimaryColor = Color(0xFF2CB1BC);
const FormColor = Color(0xFFF0F4F9);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Stack(
        children: <Widget>[
          // please replace this top item with something intuitive
          // Positioned(
          //   top:50,
          //   left:4,
          //   child: Container(
          //     width: 360,
          //     height: 10,
          //     decoration: BoxDecoration(
          //         color: Colors.white54,
          //         borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))),
          //   ),
          // ),
          Positioned(top: 60, left: 5, child: Form()),
          Positioned(
              top: 580,
              left: 140,
              child: GestureDetector(
                onTap: () {
                  // goto the signup page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    "Don't have an account?Sign Up",
                    style: TextStyle(color: Colors.white, wordSpacing: 1.2),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print('What is width ' + width.toString());
    print('What is height ' + height.toString());
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: FormColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 50,
              left: 160,
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 20,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w900),
              )),
          Positioned(
              top: 65,
              left: 30,
              child: Container(
                width: 300,
                child: TextField(
                  style: TextStyle(color: PrimaryColor, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 10, color: PrimaryColor),
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 18,
                      color: PrimaryColor,
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 125,
              left: 30,
              child: Container(
                width: 300,
                child: TextField(
                  style: TextStyle(color: PrimaryColor, fontSize: 16),
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 10, color: PrimaryColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 20,
                        color: PrimaryColor,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            print("show password");
                            if (obscureText) {
                              setState(() {
                                obscureText = false;
                              });
                            } else {
                              setState(() {
                                obscureText = true;
                              });
                            }
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 18,
                            color: PrimaryColor,
                          ))),
                ),
              )),
          Positioned(
            top: 190,
            left: 140,
            child: Text(
              'Forgot your password?',
              style: TextStyle(fontSize: 10, color: PrimaryColor),
            ),
          ),
          Positioned(
            top: 240,
            left: 110,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: 140,
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Text(
                'Or using social media',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          Positioned(
              top: 360,
              left: 110,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      IconButton(icon: Icon(FontAwesomeIcons.facebook),onPressed: (){
                        // handle facebook login
                      },),
                      IconButton(icon: Icon(FontAwesomeIcons.google),onPressed: (){
                        //handle google login
                      },),
                      IconButton(icon: Icon(FontAwesomeIcons.facebook),onPressed: (){
                        //handle twitter login
                      },)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        // insert the corresponding imsge in an imageAsset
      ),
      child: Image(
        image: AssetImage('assets/images/networks.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
