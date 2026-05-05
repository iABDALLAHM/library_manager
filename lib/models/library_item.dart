import '../library_manager.dart';

abstract class LibraryItem {
  final String title;
  LibraryItemStatus status;
  LibraryItem({required this.title, required this.status});

  // void borrow();
  // void reserve();

  @override
  String toString() {
    return "$runtimeType Title: $title, Status: $status";
  }
}
