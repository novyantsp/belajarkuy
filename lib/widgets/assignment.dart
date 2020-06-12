import 'package:belajarkuy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assignment extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final Function press;
  const Assignment({
    Key key,
    this.desc,
    this.title,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: kShadowColor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "$image",
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text("$desc")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset("assets/icons/Lock.svg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
