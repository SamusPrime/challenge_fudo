abstract class Services {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String usersEndpoint = '/users';
  static const String postsEndpoint = '/posts';
  static const String firebaseOptionsAppId = 'com.example.fudo_challenge';
  static const String firebaseOptionsProjectId = 'challengefudo';
  static const String firebaseOptionsApiKey =
      'AIzaSyBNu3m7co7_AhYm9L8BFEkuKX9tfBcfTws';
  static const String firebaseMessengerSenderId = '525382161057';
  static const int postCreationUserId = 1;
  static const int postCreationId = 1;
  static const Map<String, String> apiHeader = {
    'Content-type': 'application/json'
  };
}
