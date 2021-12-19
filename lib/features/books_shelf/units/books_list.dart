import 'package:flutter/material.dart';

class BooksList extends StatelessWidget {
  const BooksList({Key? key, required this.books})
      : super(key: key);

  final List<String> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(books[index] + index.toString()),
      ),
    );
  }
}
