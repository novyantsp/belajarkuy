import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/models/courses.dart';
import 'package:belajarkuy/widgets/assignment.dart';
import 'package:belajarkuy/widgets/bottom_navigation_belajarkuy.dart';
import 'package:belajarkuy/widgets/course_list.dart';
import 'package:belajarkuy/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'courses_content.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int jmlCourse = pythonData.length;
    int jmlAssign = pythonAssignment.length;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBelajarkuy(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xff61688B),
                            ),
                          ),
                        ),
                        Text(
                          "Python Programming",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "139 Min, $jmlCourse Courses, $jmlAssign Assignment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width:
                          size.width * .65, // it just take 60% of total width
                      child: Text(
                        "Python is an interpreted, high-level, general-purpose programming language.",
                      ),
                    ),
                    SizedBox(
                      width: size.width * .6, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: pythonData.map((content) {
                        return SessionCard(
                          seassionNum: content['number'],
                          title: content['title'],
                          isDone: true,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseContent(title: content['title'], videoURL: content['videoURL'], time: content['time'])));
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Assignment",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: pythonAssignment.map((content) {
                        return Assignment(
                          image: content['image'],
                          title: content['title'],
                          desc: content['desc'],
                          press: () {
                            print("Container was tapped");
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
