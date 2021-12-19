import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/main.dart';

main() {

  group('HomeController Testing', (){

    late HomeController homeController;

    setUp((){
      homeController = HomeController();
    });

    test('Counter Should be 1 on incrementing', () {
      homeController.increment();
      expect(homeController.counter, 1);
    });

    test('Counter Should be -1 on decrementing', () {
      homeController.decrement();
      expect(homeController.counter, -1);
    });

  });

}