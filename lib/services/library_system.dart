import '../library_manager.dart';

class LibrarySystem implements LibrarySystemInterface {
  final List<LibraryItem> _items;

  LibrarySystem({required List<LibraryItem> items}) : _items = items;

  @override
  bool changeStatus({
    required String itemName,
    required LibraryItemStatus status,
  }) {
    final item = _items.where((item) => item.title == itemName).firstOrNull;
    if (item == null) return false;
    item.status = status;
    return true;
  }

  @override
  bool addNewItem({required LibraryItem newItem}) {
    for (var existItem in _items) {
      if (newItem.title == existItem.title) {
        return false;
      }
    }
    _items.add(newItem);
    return true;
  }

  @override
  List<LibraryItem>? getItems() {
    if (_items.isEmpty) {
      return null;
    } else {
      return _items;
    }
  }

  @override
  void getItemByName() {}

  @override
  void getItemsByStatus() {}

  @override
  void removeItem() {}

  @override
  void searchItem() {}
}
