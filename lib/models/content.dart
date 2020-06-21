class Content {
  String id, title, description, video, duration, courseId, iscomplete;

  Content(
    this.id,
    this.title,
    this.description,
    this.video,
    this.duration,
    this.iscomplete,
    this.courseId,
  );

  Content.fromJson(Map<String, dynamic> jsonObject){
    this.id = jsonObject['id'].toString();
    this.title = jsonObject['title'].toString();
    this.description = jsonObject['description'].toString();
    this.video = jsonObject['video'].toString();
    this.duration = jsonObject['duration'].toString();
    this.iscomplete = jsonObject['iscomplete'].toString();
    this.courseId = jsonObject['course_id'].toString();
  }
}