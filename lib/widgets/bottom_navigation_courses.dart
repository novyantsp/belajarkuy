import 'package:belajarkuy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationCourse extends StatefulWidget {
  @override
  _BottomNavigationCourseState createState() => _BottomNavigationCourseState();
}

class _BottomNavigationCourseState extends State<BottomNavigationCourse> {
  int _selectedIndex = 0;
  var bottomTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: RaisedButton(
          color: kBlueColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          onPressed: () {},
          child: Text(
            "Mark as Complete",
            style: TextStyle(fontSize: 14.0),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
              side: BorderSide(color: Colors.transparent)),
        ));
  }
}
