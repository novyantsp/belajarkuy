import 'package:belajarkuy/api/courses_api.dart';
import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/screens/details_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationCourse extends StatefulWidget {
  final String courseID, contentID, courseDesc, courseTitle;
  final courseCount;

  const BottomNavigationCourse(
      {Key key,
      this.courseID,
      this.contentID,
      this.courseDesc,
      this.courseCount,
      this.courseTitle})
      : super(key: key);

  @override
  _BottomNavigationCourseState createState() => _BottomNavigationCourseState();
}

class _BottomNavigationCourseState extends State<BottomNavigationCourse> {
  CoursesApi coursesApi = CoursesApi();

  var bottomTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        child: RaisedButton(
          color: kBlueColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            coursesApi.putContent(widget.courseID, widget.contentID);
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          courseID: widget.courseID,
                          title: widget.courseTitle,
                          description: widget.courseDesc,
                          countContent: widget.courseCount,
                        )));
            
            // print(widget.courseTitle);
          },
          child: Text(
            "Mark as Complete",
            style: TextStyle(fontSize: 14.0),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              side: BorderSide(color: Colors.transparent)),
        ));
  }
}
