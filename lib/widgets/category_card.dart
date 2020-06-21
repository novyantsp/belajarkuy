import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/models/course.dart';
import 'package:belajarkuy/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final List<Course> listData;

  const CategoryCard({
    Key key,
    this.listData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listData.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 17,
                    spreadRadius: -23,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  courseID: listData[index].id,
                                  title: listData[index].title,
                                  description: listData[index].description,
                                  countContent: listData[index].countContent,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        SvgPicture.network(listData[index].imageURL),
                        Spacer(),
                        Text(
                          listData[index].title,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
