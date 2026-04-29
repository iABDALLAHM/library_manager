import 'package:library_manager/book_enum.dart';
import 'package:library_manager/library_item.dart';

abstract class LibrarySystemInterface {
  List<LibraryItem> get items;
  void addNewItem({required LibraryItem item});
  void changeStatus({required String itemName, required Status status});
}
