import 'package:flutter/material.dart';
import 'units/books_list.dart';

class BooksShelfView extends StatelessWidget {
  const BooksShelfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BooksList(books: List.generate(20, (index) => 'Book '),),
    );
  }
}

