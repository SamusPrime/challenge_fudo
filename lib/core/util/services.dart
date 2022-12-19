abstract class Services {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String usersEndpoint = '/users';
  static const String postsEndpoint = '/posts';

  static const int postCreationUserId = 1;
  static const int postCreationId = 1;
  static const Map<String, String>? apiHeader = {
    'Content-type': 'application/json'
  };
}
