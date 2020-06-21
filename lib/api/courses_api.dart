import 'dart:convert';
import 'package:belajarkuy/api/api_util.dart';
import 'package:belajarkuy/models/content.dart';
import 'package:belajarkuy/models/course.dart';
import 'package:http/http.dart' as http;

class CoursesApi {
  Future<List<Course>> fetchAllCourses() async {
    String allCourses = ApiUtil.MAIN_API_URL + ApiUtil.ALL_COURSES;
    Map<String, String> headers = {'Accept': 'application/json'};

    var response = await http.get(allCourses, headers: headers);
    List<Course> courses = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);

      for (var item in body['data']) {
        Course course = Course.fromJson(item);
        courses.add(course);
      }
      // print(courses);
    }
    // print(courses);
    return courses;
    // print(response.statusCode);
    // print(response.body);
  }

  Future<List<Content>> fetchCourseContent(String courseID) async {
    String allCourseContents = ApiUtil.courseContents(courseID);
    Map<String, String> headers = {'Accept': 'application/json'};

    var response = await http.get(allCourseContents, headers: headers);
    List<Content> courseContents = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);

      for (var item in body['data']) {
        Content content = Content.fromJson(item);
        courseContents.add(content);
      }
      // print(courses);
    }
    return courseContents;
    // print(response.statusCode);
    // print(response.body);
  }

  Future<Content> putContent(String courseID, String contentID) async {
    String contentURL = ApiUtil.putIsComplete(courseID, contentID);
    // ApiUtil.putIsComplete(courseID, contentID);
    print(contentURL);
    var response = await http.put(contentURL, 
      body: {
        "iscomplete": "1"
      },
    );
    // print(response.body);

    if (response.statusCode == 200) {
    // If the server did return a 200 UPDATED response,
    // then parse the JSON.
    return Content.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 UPDATED response,
    // then throw an exception.
    throw Exception('Failed to load content');
  }
    // print(courses);
  }
}
