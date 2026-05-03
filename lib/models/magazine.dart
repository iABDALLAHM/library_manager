import '../library_manager.dart';

class Magazine extends LibraryItem {
  final int issueNumber;
  final String publisher;

  Magazine({
    required super.title,
    required super.status,
    required this.issueNumber,
    required this.publisher,
  });
  @override
  void borrow() {
    print("Borrowing a Magazine");
  }

  @override
  void reserve() {
    print("Reserve a Magazine");
  }
}
