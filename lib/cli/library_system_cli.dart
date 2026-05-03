import 'dart:io';
import '../library_manager.dart';

class LibrarySystemCli {
  LibrarySystem system = LibrarySystem(items: []);

  void start() {
    while (true) {
      _showMenu();
      String? choice = stdin.readLineSync();
      if (choice == null || choice.isEmpty) {
        print("invalid input");
      } else {
        if (choice == "1") {
          _getTheAvailable();
        } else if (choice == "2") {
          _addNewBook();
        } else if (choice == "3") {
          _addNewDvd();
        } else if (choice == "4") {
          _addNewMagazine();
        } else if (choice == "5") {
          _borrow();
        } else if (choice == "6") {
          _reserve();
        } else if (choice == "7") {
          _exitSystem();
        }
      }
    }
  }

  void _showMenu() {
    print("=======Library Managment System============");
    print("please choose from these:\n");
    print("1. Get all the available in the library");
    print("2. Add New Book");
    print("3. Add New DVD");
    print("4. Add New Magazine");
    print("5. I Need to borrow");
    print("6. I Need to reserve");
    print("7. Exit system");
  }

  void _getTheAvailable() {
    print("The items available in the library: ${system.items}");
  }

  void _addNewBook() {
    print("Enter book Details\n");
    Book newBook;
    print("Enter Book Name :");
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("invalid input");
    } else {
      newBook = Book(
        title: name,
        status: Status.available,
        author: '',
        pages: 34,
        isbn: '',
      );
      system.addNewItem(item: newBook);
      print("New Book Added\n");
    }
  }

  void _addNewDvd() {
    print("Enter DVD Details\n");
    DVD newDvd;
    print("Enter DVD Name :");
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("invalid input");
    } else {
      newDvd = DVD(
        title: name,
        status: Status.available,
        duration: 23,
        director: '',
      );
      system.addNewItem(item: newDvd);
    }
  }

  void _addNewMagazine() {
    print("Enter Magazine Details\n");
    Magazine newMagazine;
    print("Enter Magazine Name :");
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("invalid input");
    } else {
      newMagazine = Magazine(
        title: name,
        status: Status.available,
        issueNumber: 345,
        publisher: '',
      );
      system.addNewItem(item: newMagazine);
    }
  }

  void _borrow() {
    print("Enter item name: \n");

    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("invalid input");
    } else {
      system.changeStatus(itemName: name, status: Status.borrowed);
    }
  }

  void _reserve() {
    print("Enter item name: \n");
    String? name = stdin.readLineSync();
    if (name == null || name.isEmpty) {
      print("invalid input");
    } else {
      system.changeStatus(itemName: name, status: Status.reserved);
    }
  }

  void _exitSystem() {
    print("Library System Closed\n");
  }
}
