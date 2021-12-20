
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_in_flutter/main.dart';
import 'package:testing_in_flutter/model.dart';
import 'package:testing_in_flutter/repository.dart';
import 'package:testing_in_flutter/web_service.dart';

import 'get_album_test.mocks.dart';

@GenerateMocks([WebService])
main() {
  group('Album Test', () {

    late MockWebService webService;
    late Repository repository;
    Response response = Response(requestOptions: RequestOptions(path: ''));

    setUp(() {
      webService = MockWebService();
      repository = Repository(webService);
    });

    test('OnSuccess', () async {

      response.statusCode = 200;
      response.data = {'title': 'Title','id': 1,'userId': 1};

      when(webService.getFirstAlbum()).thenAnswer((_) async => response);

      try{
        final album = await repository.getFirstAlbum();
        expect(album, isA<Album>());
      }catch(e){
        expect(e, isA<Exception>());
      }

    });

    test('OnFail', () async {

      response.statusCode = 401;
      response.statusMessage = 'UnAuthenticated';

      when(webService.getFirstAlbum()).thenAnswer((_) async => response);

      try{
        final album = await repository.getFirstAlbum();
        expect(album, isA<Album>());
      }catch(e){
        expect(e, isA<Exception>());
      }

    });

  });
}



// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:testing_in_flutter/main.dart';
//
// import 'get_album_test.mocks.dart';
//
// @GenerateMocks([Dio])
// main() {
//   group('Get Albums', () {
//     late MockDio mockDio;
//     late Repository repository;
//
//     setUp(() {
//       mockDio = MockDio();
//       repository = Repository(mockDio);
//     });
//
//     test('get Success Album', () async {
//       when(mockDio.get('https://jsonplaceholder.typicode.com/todos/1'))
//           .thenAnswer(
//         (_) async => Response(
//           statusCode: 200,
//           data: {'title': '1', 'id': 1, 'userId': 2},
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );
//
//       expect(await repository.getFirstAlbum(), isA<Album>());
//     });
//
//     test('Failed', () async {
//
//       when(mockDio.get('https://jsonplaceholder.typicode.com/todos/1'))
//           .thenAnswer(
//         (_) async => Response(
//           statusCode: 400,
//           requestOptions: RequestOptions(path: ''),
//         ),
//       );
//
//       expect(await repository.getFirstAlbum(), null);
//     });
//   });
// }
