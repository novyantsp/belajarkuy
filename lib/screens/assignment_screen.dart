import 'package:belajarkuy/constants/constants.dart';
import 'package:belajarkuy/widgets/bottom_navigation_assignment.dart';
import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  final title;
  final time;
  final desc;

  const AssignmentScreen({Key key, this.title, this.time, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationAssignment(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .49,
            decoration: BoxDecoration(
                color: Color(0xFFcbf3f0),
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
                          "$title",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "$desc",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 12),
                            blurRadius: 20,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "$title",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  //Description
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Description",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tellus tellus, pulvinar vitae eros et, feugiat imperdiet sem. Donec ultricies eleifend leo a rhoncus. Pellentesque id nisi neque. Donec maximus massa sem. Nulla tincidunt gravida leo, at hendrerit arcu ornare vulputate. Nam id nibh mollis, tincidunt justo quis, gravida nisi. Vivamus tincidunt turpis a est hendrerit, ut fringilla dolor semper. Sed mollis nulla nisi, at ornare nibh sollicitudin nec."),
                                  ),
                                  //Criteria Assignment
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Criteria",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam tellus tellus, pulvinar vitae eros et, feugiat imperdiet sem. Donec ultricies eleifend leo a rhoncus. Pellentesque id nisi neque. Donec maximus massa sem. Nulla tincidunt gravida leo, at hendrerit arcu ornare vulputate. Nam id nibh mollis, tincidunt justo quis, gravida nisi. Vivamus tincidunt turpis a est hendrerit, ut fringilla dolor semper. Sed mollis nulla nisi, at ornare nibh sollicitudin nec."),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Upload Assignment",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: FlatButton.icon(
                                          label: Text('Upload Assignment'),
                                          icon: Icon(Icons.cloud_upload),
                                          onPressed: () {}),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
