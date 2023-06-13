import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mys/models/FetchSong.dart';

class PlayerController extends GetxController {
  Future<FetchedSong> fetchHome() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/home'));
    if (response.statusCode == 200) {
      FetchedSong fetchedSong = FetchedSong.fromRawJson(response.body);
      return fetchedSong;
    } else {
      throw Exception("Failed to get home");
    }
  }
}
