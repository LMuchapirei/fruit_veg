import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/views/login_screen.dart';


const PrimaryColor=Color(0xFF2CB1BC);
const FormColor=Color(0xFFF0F4F9);
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  PrimaryColor,
      body: Stack(
        children: <Widget>[
          // please replace this top item with something intuitive
          // Positioned(
          //   top:44,
          //   left:60,
          //   child: Container(
          //     width: 360,
          //     height: 16,
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
                  // Navigate to the signin screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                              child: Text("Already have an account?Sign In",
                style: TextStyle(
                  color:Colors.white,
                  wordSpacing: 1.2
                ),),
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
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
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
                "Sign Up",
                style: TextStyle(fontSize: 20,
                color: PrimaryColor),
              )),
          Positioned(
              top:85,
              left: 30,
              child: Container(
                width: 360,
                child: TextField(
                  style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 16
                  ),
                  decoration: InputDecoration(
                    
                    hintText: 'Email Address',
                    hintStyle: TextStyle(fontSize: 10,color: PrimaryColor), 
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 18,
                      color: PrimaryColor,
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 145,
              left: 30,
              child: Container(
                width: 360,
                child: TextField(
                  style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 16
                  ),
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 10,color: PrimaryColor),
                      prefixIcon: Icon(Icons.lock, size: 20,color: PrimaryColor,),
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
                          child: Icon(Icons.remove_red_eye, size: 18,color: PrimaryColor,))),
                ),
              )),
              Positioned(
                              top: 210,
                              left: 30,
                            child: Container(
                width: 360,
                child: TextField(
                  style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 16
                  ),
                  obscureText: obscureTextConfirm,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(fontSize: 10,color: PrimaryColor),
                      prefixIcon: Icon(Icons.lock, size: 20,color: PrimaryColor,),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            print("show password");
                            if (obscureTextConfirm) {
                              setState(() {
                                obscureTextConfirm = false;
                              });
                            } else {
                              setState(() {
                                obscureTextConfirm = true;
                              });
                            }
                          },
                          child: Icon(Icons.remove_red_eye, size: 18,color: PrimaryColor,))),
                ),
              )
              ),
             Positioned(
               top: 280,
               left: 110,
              child: Container(
                 height: 40,
                 width: 160,
                 decoration: BoxDecoration(
                   color: PrimaryColor,
                   borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text('Sign Up',style: TextStyle(
                    color:Colors.white
                  ),),
                ),
               ),
             ),
           Positioned(
                              top: 380,
                              left: 140,
                              child: Text('Or using social media',style: TextStyle(
                  fontSize: 10,
                  color: PrimaryColor
                ),),
              ),
            Positioned(
              top: 420,
              left: 120,
              child: Row(children: <Widget>[
                IconButton(icon: Icon(FontAwesomeIcons.facebook),onPressed: (){
                        // handle facebook login
                      },),
                      IconButton(icon: Icon(FontAwesomeIcons.google),onPressed: (){
                        //handle google login
                      },),
                      IconButton(icon: Icon(FontAwesomeIcons.facebook),onPressed: (){
                        //handle twitter login
                      },)
            ],))
        ],
      ),
    );
  }
}



class SocialMediaIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      // insert the corresponding imsge in an imageAsset
      ),
      child: FlutterLogo(size: 30,),
    );
  }
}