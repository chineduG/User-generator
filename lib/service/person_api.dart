import 'dart:convert';

import 'package:bts_app_api3/model/person.dart';
import 'package:http/http.dart' as http;

class PersonNetworkService {
  // User url
  final userURL = 'https://randomuser.me/api/';
  // initial numbers of user = 5000.
  // ?results=5000
  // getting a total number of 50 users.
  Future<List<Results>> fetchPersons(int amount) async {
    var response = await http.get(Uri.parse('$userURL?result=$amount'));
    if (response.statusCode == 200) {
      // Mapping the List of Data from the API
      Map res = jsonDecode(response.body);
      List<dynamic> people = res['results'];
      return people.map((json) => Results.fromJson(json)).toList();
      // Or simply returning the List with
      // var res = jsonDecode(response.body);
      // return res;
    } else {
      throw Exception('Something went wrong, ${response.toString()}');
    }
  }
}
