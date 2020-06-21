import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/models/content.dart';
import 'package:belajarkuy/screens/courses_content.dart';
import 'package:flutter/material.dart';

class CourseContents extends StatelessWidget {
  final List<Content> courseData;
  final courseID;
  final courseDesc;
  final courseCount;
  final courseTitle;
  
  const CourseContents({
    Key key,
    this.courseData, this.courseID, this.courseDesc, this.courseCount, this.courseTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
        itemCount: courseData.length,
        itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
            // constraint.maxWidth provide us the available with for this widget
            // padding: EdgeInsets.all(16),
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
                onTap: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseContent(
                                  title: courseData[index].title,
                                  description: courseData[index].description,
                                  time: courseData[index].duration,
                                  videoURL: courseData[index].video,
                                  contentID: courseData[index].id,
                                  courseID: courseID,
                                  courseCount: courseCount,
                                  courseDesc: courseDesc,
                                  courseTitle: courseTitle,
                                )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 42,
                        width: 43,
                        decoration: BoxDecoration(
                          color: courseData[index].iscomplete == "0" ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: courseData[index].iscomplete == "0" ? Colors.white : kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        courseData[index].title,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
        );
  });
  }
}