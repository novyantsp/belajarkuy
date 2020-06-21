import 'package:flutter/material.dart';

class BottomNavigationAssignment extends StatefulWidget {
  @override
  _BottomNavigationAssignmentState createState() => _BottomNavigationAssignmentState();
}

class _BottomNavigationAssignmentState extends State<BottomNavigationAssignment> {
  var bottomTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: RaisedButton(
          color: Color(0xFF2ec4b6),
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          onPressed: () {},
          child: Text(
            "Turn in Assignment",
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
