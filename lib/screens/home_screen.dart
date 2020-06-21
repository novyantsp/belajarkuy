import 'package:belajarkuy/api/courses_api.dart';
import 'package:belajarkuy/models/course.dart';
import 'package:belajarkuy/widgets/bottom_navigation_belajarkuy.dart';
import 'package:belajarkuy/widgets/category_card.dart';
import 'package:belajarkuy/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CoursesApi coursesApi = CoursesApi();

  @override
  void initState() {
    super.initState();
    coursesApi.fetchAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavigationBelajarkuy(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                ),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Hi, \nLenop",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: FutureBuilder(
                      future: coursesApi.fetchAllCourses(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Course>> snapshot) {
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
                                  child: Text("Something Wrong"),
                                ),
                              );
                            } else {
                              return CategoryCard(listData: snapshot.data);
                            }
                            break;
                        }

                        return Text('Oops');
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
