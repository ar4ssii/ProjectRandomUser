import 'dart:convert';

String? name;
String? gender;
String? country;
String? email;
String? age;
String? phoneNumber;
String? username;

class RandomUser{
  static List<Map<String,dynamic>> user = [];

  static String getName(user){
    return user[0]['results'][0]['name']['title'] + '. ' + user[0]['results'][0]['name']['first'] + ' ' + user[0]['results'][0]['name']['last'];
  }

  static String getGender(user){
    return user[0]['results'][0]['gender'];
  }

  static String getCountry(user){
    return user[0]['results'][0]['location']['country'];
  }

  static String getEmail(user){
    return user[0]['results'][0]['email'];
  }

  static String getAge(user){
    return user[0]['results'][0]['dob']['age'].toString();
  }

  static String getPhoneNumber(user){
    return user[0]['results'][0]['phone'];
  }

  static String getUsername(user){
    return user[0]['results'][0]['login']['username'];
  }
  static String getProfile(user){
    return user[0]['results'][0]['picture']['large'];
  }
}
