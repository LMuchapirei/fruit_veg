import 'package:flutter/material.dart';



const Color blueColor=const Color(0xFF14919B);
// const Color(0xFF2372F0);
final Color iconBackgrounColor=Color(0xFF647082);
class BottomBar extends StatefulWidget {
 

  const BottomBar({Key key, }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex=0;
  // void onTap(int tappedItemIndex){
  //   setState(() {
      
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:14.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex=0;
                    });
                  },
                  child: _BarItem(icon:Icons.home,title:'Home',isSelected:_selectedIndex==0)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex=1;
                    });
                  },
                  child: _BarItem(icon:Icons.person,title:'Profile',isSelected:_selectedIndex==1)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex=2;
                    });
                  },
                  child: _BarItem(icon:Icons.settings,title:'Setting',isSelected:_selectedIndex==2)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex=3;
                    });
                  },
                  child: _BarItem(icon:Icons.bookmark,title:'Wishlist',isSelected:_selectedIndex==3)),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _BarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  const _BarItem({Key key, this.icon, this.title, this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected?blueColor:Colors.white
      ),
      
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon,
          color: isSelected?Colors.white:iconBackgrounColor,),
          if (isSelected) VerticalDivider(color: iconBackgrounColor,),
          if(isSelected) Flexible(
            fit: FlexFit.loose,
            child: Text(title,
            style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}