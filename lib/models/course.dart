class Course{
  String id;
  String title;
  String imageURL;
  String description;
  String countContent;

  Course(
    this.id,
    this.title,
    this.imageURL,
    this.description,
    this.countContent,
  );

  Course.fromJson(Map<String, dynamic> jsonObject){
    this.id = jsonObject['id'].toString();
    this.title = jsonObject['title'].toString();
    this.imageURL = jsonObject['imageURL'].toString();
    this.description = jsonObject['description'].toString();
    this.countContent = jsonObject['count_content'].toString();
  }
}