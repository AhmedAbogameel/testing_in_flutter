import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WebService {

  Future<Response> getFirstAlbum() async {
    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/1');
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

}