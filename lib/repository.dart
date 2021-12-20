import 'package:flutter/foundation.dart';

import 'model.dart';
import 'web_service.dart';

class Repository {

  final WebService webService;

  Repository(this.webService);

  Future<Album> getFirstAlbum() async {
    try {
      final response = await webService.getFirstAlbum();
      if(response.statusCode == 200){
        debugPrint(response.data.toString());
        return Album.fromJson(response.data);
      }else {
        throw Exception(response.statusMessage ?? 'Error');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}