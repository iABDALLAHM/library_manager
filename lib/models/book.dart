import '../library_manager.dart';

class Book extends LibraryItem {
  final String author;
  final int pages;
  final String isbn;
  Book({
    required super.title,
    required super.status,
    required this.author,
    required this.pages,
    required this.isbn,
  });

  // @override
  // void borrow() {
  //   print("Borrowing a book");
  // }

  // @override
  // void reserve() {
  //   print("Reserve a book");
  // }
}
