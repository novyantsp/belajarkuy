import 'package:belajarkuy/api/courses_api.dart';
import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/models/content.dart';
import 'package:belajarkuy/screens/home_screen.dart';
import 'package:belajarkuy/widgets/bottom_navigation_belajarkuy.dart';
import 'package:belajarkuy/widgets/course_list.dart';
import 'package:belajarkuy/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String courseID;
  final String title;
  final String description;
  final String countContent;

  const DetailsScreen(
      {Key key, this.courseID, this.title, this.description, this.countContent})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  CoursesApi coursesApi = CoursesApi();

  @override
  void initState() {
    super.initState();
    coursesApi.fetchCourseContent(widget.courseID);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff61688B),
                          ),
                        ),
                      ),
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total " + widget.countContent + " Courses",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .65, // it just take 60% of total width
                    child: Text(
                      "Python is an interpreted, high-level, general-purpose programming language.",
                    ),
                  ),
                  SizedBox(
                    width: size.width * .6, // it just take the 50% width
                    child: SearchBar(),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: coursesApi.fetchCourseContent(widget.courseID),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Content>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            break;
                          case ConnectionState.waiting:
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            break;
                          case ConnectionState.active:
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            break;
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Container(
                                child: Center(
                                  child: Text(snapshot.error.toString()),
                                ),
                              );
                            } else {
                              return CourseContents(
                                courseData: snapshot.data,
                                courseID: widget.courseID,
                                courseCount: widget.countContent,
                                courseDesc: widget.description,
                                courseTitle: widget.title,
                              );
                            }
                            break;
                        }

                        return Text('Oops');
                      },
                    ),
                  ),
                  // Wrap(
                  //   spacing: 20,
                  //   runSpacing: 20,
                  //   children: pythonData.map((content) {
                  //     return CourseContents(
                  //       title: content['title'],
                  //       isDone: true,
                  //       press: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => CourseContent(title: content['title'], videoURL: content['videoURL'], time: content['time'])));
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
