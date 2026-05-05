import '../library_manager.dart';

class DVD extends LibraryItem {
  final int duration;
  final String director;
  DVD({
    required super.title,
    required super.status,
    required this.duration,
    required this.director,
  });


  // @override
  // void borrow() {
  //   print("Borrowing a DVD");
  // }

  // @override
  // void reserve() {
  //   print("Reserve a DVD");
  // }
}
