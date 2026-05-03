import 'dart:io';
import '../library_manager.dart';

class LibrarySystemCli {
  LibrarySystem? system = LibrarySystem(items: []);

  void start() {
    while (true) {
      _showMenu();
      String? choice = stdin.readLineSync();
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
    print("The items available in the library: ${system!.items}");
  }

  void _addNewBook() {
    print("Enter book Details\n");
    Book newBook;
    print("Enter Book Name :");
    String? name = stdin.readLineSync();
    newBook = Book(title: name!, status: Status.available);
    system!.addNewItem(item: newBook);
    print("New Book Added\n");
  }

  void _addNewDvd() {
    print("Enter DVD Details\n");
    DVD newDvd;
    print("Enter DVD Name :");
    String? name = stdin.readLineSync();
    newDvd = DVD(title: name!, status: Status.available);
    system!.addNewItem(item: newDvd);
  }

  void _addNewMagazine() {
    print("Enter Magazine Details\n");
    Magazine newMagazine;
    print("Enter Magazine Name :");
    String? name = stdin.readLineSync();
    newMagazine = Magazine(title: name!, status: Status.available);
    system!.addNewItem(item: newMagazine);
  }

  void _borrow() {
    print("what are you need to borrow?\n");
    print("1. A Book?");
    print("2. A Dvd?");
    print("3. A Magazine?");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      print("enter the book name:");
      String? name = stdin.readLineSync();
      system!.changeStatus(itemName: name!, status: Status.borrowed);
    } else if (choice == "2") {
      print("enter the Dvd name:");
      String? name = stdin.readLineSync();

      system!.changeStatus(itemName: name!, status: Status.borrowed);
    } else if (choice == "3") {
      print("enter the Magzine name:");
      String? name = stdin.readLineSync();
      system!.changeStatus(itemName: name!, status: Status.borrowed);
    }
  }

  void _reserve() {
    print("what are you need to reserve?\n");
    print("1. A Book?");
    print("2. A Dvd?");
    print("3. A Magazine?");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      print("enter the book name:");
      String? name = stdin.readLineSync();
      system!.changeStatus(itemName: name!, status: Status.reserved);
    } else if (choice == "2") {
      print("enter the Dvd name:");
      String? name = stdin.readLineSync();

      system!.changeStatus(itemName: name!, status: Status.reserved);
    } else if (choice == "3") {
      print("enter the Magzine name:");
      String? name = stdin.readLineSync();
      system!.changeStatus(itemName: name!, status: Status.reserved);
    }
  }

  void _exitSystem() {
    print("Library System Closed\n");
  }
}
