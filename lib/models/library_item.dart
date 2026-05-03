import '../library_manager.dart';

abstract class LibraryItem {
  String title;
  Status status;
  LibraryItem({required this.title, required this.status});

  void borrow();
  void reserve();

  @override
  String toString() {
    return "[$runtimeType] Title: $title, Status: $status";
  }
}
