import '../library_manager.dart';

abstract class LibrarySystemInterface {
  List<LibraryItem>? getItems();
  bool addNewItem({required LibraryItem newItem});
  bool changeStatus({
    required String itemName,
    required LibraryItemStatus status,
  });
  void removeItem();
  void searchItem();
  void getItemByName();
  void getItemsByStatus();
}
