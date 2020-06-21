import 'package:belajarkuy/models/content.dart';

class CourseDetail {
  String id, title, description, createdAt;
  List<Content> courseContent;

  CourseDetail(
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.courseContent,
  );

  CourseDetail.fromJson(Map<String, dynamic> jsonObject){
    this.id = jsonObject['id'].toString();
    this.description = jsonObject['description'].toString();
    this.createdAt = jsonObject['created_at'].toString();
    this.courseContent = jsonObject['course_content'].map( (Map<String, dynamic> jsonCourseContent){
      return Content.fromJson(jsonCourseContent);
    } ).toList();
  }
}