import '../library_manager.dart';


abstract class LibrarySystemInterface {
  List<LibraryItem> get items;
  void addNewItem({required LibraryItem item});
  void changeStatus({required String itemName, required Status status});
}
