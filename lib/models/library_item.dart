import '../library_manager.dart';

abstract class LibraryItem {
  String? _title;
  Status? _status;
  LibraryItem({required String title, required Status status}) {
    _title = title;
    _status = status;
  }

  @override
  String toString() {
    return "The title of this item : $_title";
  }

  Status? get status {
    return _status;
  }

  String? get title {
    return _title;
  }

  set title(String title) {
    _title = title;
  }

  set status(Status status) {
    _status = status;
  }
}
