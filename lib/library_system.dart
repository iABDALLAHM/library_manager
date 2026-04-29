import 'package:library_manager/book_enum.dart';
import 'package:library_manager/library_item.dart';
import 'package:library_manager/library_system_iterface.dart';

class LibrarySystem implements LibrarySystemInterface {
  List<LibraryItem>? _items;

  LibrarySystem({required List<LibraryItem> items}) {
    _items = items;
  }

  @override
  List<LibraryItem> get items {
    return _items!;
  }

  @override
  void changeStatus({required String itemName, required Status status}) {
    for (var item in _items!) {
      if (item.title == itemName) {
        item.status = status;
      }
    }
  }

  @override
  void addNewItem({required LibraryItem item}) {
    _items!.add(item);
  }
}
