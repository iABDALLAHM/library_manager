import '../library_manager.dart';

class LibrarySystemCli {
  final LibrarySystemInterface system;
  final LibraryView libraryView;
  final InputHandler inputHandler;
  bool isRunning;

  LibrarySystemCli({
    this.isRunning = true,
    required this.system,
    required this.libraryView,
    required this.inputHandler,
  });

  void start() {
    while (isRunning) {
      _showMenu();
      String? choice = inputHandler.readLine(
        label: "please choose from these:\n",
      );
      // ازاي لو عايز اضيف item جديدة تسمع هنا علطول؟
      switch (choice) {
        case MenuOptions.getAvailable:
          _getTheAvailable();
          break;
        case MenuOptions.addBook:
          _addNewItem(type: LibraryItemType.book);
          break;
        case MenuOptions.addDVD:
          _addNewItem(type: LibraryItemType.dvd);
          break;
        case MenuOptions.addMagazine:
          _addNewItem(type: LibraryItemType.magazine);
          break;
        case MenuOptions.borrow:
          _changeItemStatus(status: LibraryItemStatus.borrowed);
          break;
        case MenuOptions.reserve:
          _changeItemStatus(status: LibraryItemStatus.reserved);
          break;
        case MenuOptions.exit:
          _exitSystem();
        default:
          libraryView.showMessage(message: "invalid Input\n");
          break;
      }
    }
  }

  void _addNewItem({required LibraryItemType type}) {
    switch (type) {
      case LibraryItemType.book:
        final String? name = inputHandler.readLine(label: "Enter Book Name: ");
        final String? author = inputHandler.readLine(
          label: "Enter Book Author: ",
        );
        final String? pages = inputHandler.readLine(
          label: "Enter Book Number of Pages: ",
        );
        final String? isbn = inputHandler.readLine(
          label: "Enter Book isbn (International Standard Book Number): ",
        );

        if (name == null || author == null || isbn == null || pages == null) {
          // الشكل ده مش عاجبني بس مش عارف اغيره ازاي ؟
          libraryView.showMessage(message: "invalid Input\n");
          return;
        }

        int? pagesNumber = int.tryParse(pages);
        if (pagesNumber == null) {
          libraryView.showMessage(message: "Pages must be a valid number\n");
          return;
        }

        final Book newBook = Book(
          title: name,
          status: LibraryItemStatus.available,
          author: author,
          pages: pagesNumber,
          isbn: isbn,
        );

        _addItemToSystem(newItem: newBook);

        break;

      case LibraryItemType.dvd:
        final String? name = inputHandler.readLine(label: "Enter DVD Name :");
        final String? duration = inputHandler.readLine(
          label: "Enter DVD Duration :",
        );
        final String? director = inputHandler.readLine(
          label: "Enter DVD Director :",
        );

        if (name == null || duration == null || director == null) {
          libraryView.showMessage(message: "invalid Input\n");
          return;
        }

        int? durationDVD = int.tryParse(duration);
        if (durationDVD == null) {
          libraryView.showMessage(message: "duration must be a vaild number\n");
          return;
        }

        final DVD newDVD = DVD(
          title: name,
          status: LibraryItemStatus.available,
          duration: durationDVD,
          director: director,
        );

        _addItemToSystem(newItem: newDVD);
        break;

      case LibraryItemType.magazine:
        final String? name = inputHandler.readLine(
          label: "Enter Magazine Name :",
        );
        final String? issueNumber = inputHandler.readLine(
          label: "Enter Magazine IssueNumber :",
        );
        final String? publisherName = inputHandler.readLine(
          label: "Enter Magazine PublisherName :",
        );

        if (name == null || issueNumber == null || publisherName == null) {
          libraryView.showMessage(message: "invalid Input\n");
          return;
        }

        int? issueMagazineNumber = int.tryParse(issueNumber);
        if (issueMagazineNumber == null) {
          libraryView.showMessage(
            message: "issue number must be a vaild number\n",
          );
          return;
        }

        final Magazine newMagazine = Magazine(
          title: name,
          status: LibraryItemStatus.available,
          issueNumber: issueMagazineNumber,
          publisher: publisherName,
        );
        _addItemToSystem(newItem: newMagazine);
        break;
    }
  }

  void _addItemToSystem({required LibraryItem newItem}) {
    var result = system.addNewItem(newItem: newItem);
    if (result) {
      libraryView.showMessage(message: "Item added successfully");
    } else {
      libraryView.showMessage(message: "Item already exists");
    }
  }

  void _getTheAvailable() {
    var itemsInList = system.getItems();
    if (itemsInList == null) {
      libraryView.showMessage(
        message: "There are no existing items in the Library\n",
      );
    } else {
      libraryView.showMessage(
        message: "The items available in the library: $itemsInList\n",
      );
    }
  }

  void _changeItemStatus({required LibraryItemStatus status}) {
    final String? name = inputHandler.readLine(label: "Enter item name: \n");
    if (name == null) {
      libraryView.showMessage(message: "invalid Input\n");
    } else {
      var result = system.changeStatus(itemName: name, status: status);
      if (result) {
        libraryView.showMessage(message: "item status Changed successfuly\n");
      } else {
        libraryView.showMessage(message: "This item does not exist\n");
      }
    }
  }

  void _exitSystem() {
    libraryView.showMessage(message: "Library System Closed\n");
    isRunning = false;
  }

  void _showMenu() {
    libraryView.showMessage(message: "=======Library Managment System=======");
    libraryView.showMessage(message: MenuText.showMenu);
  }
}
