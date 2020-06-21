class ApiUtil{

  static const String MAIN_API_URL = 'https://belajarkuy.novyantsp.my.id/api';
  static const String ALL_COURSES = '/courses';
  static String courseContents( String courseID ){
    return MAIN_API_URL + ALL_COURSES + '/' + courseID + '/list-course';
  }

  static String putIsComplete(  [String courseID ,String contentID]){
    return MAIN_API_URL + ALL_COURSES + '/' + courseID + '/list-course/' + contentID;
  }
}