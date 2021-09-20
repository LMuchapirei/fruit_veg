import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../ui/viewutils/textutils.dart';

class SelectableItem extends StatelessWidget {
  final Icon icon;
  final int index;

  const SelectableItem({Key? key, required this.icon, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 40,
      child: icon,
    );
  }
}

class SelectableItemExanded extends StatelessWidget {
  final Icon icon;
  final String text;
  final int index;

  const SelectableItemExanded(
      {Key? key, required this.icon, required this.text, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: icon,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(color: iconColor, fontSize: 12),
          ))
        ],
      ),
    );
  }
}

class SelectableItemSvg extends StatelessWidget {
  final SvgPicture svgPicture;
  final int index;

  const SelectableItemSvg(
      {Key? key, required this.svgPicture, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 40,
      child: svgPicture,
    );
  }
}

class SelectableItemExandedSvg extends StatelessWidget {
  final SvgPicture svgPicture;
  final String text;
  final int index;

  const SelectableItemExandedSvg(
      {Key? key,
      required this.svgPicture,
      required this.text,
      required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: svgPicture,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(color: iconColor, fontSize: 12),
          ))
        ],
      ),
    );
  }
}
