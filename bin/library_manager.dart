import 'package:library_manager/cli/library_system_cli.dart';
import 'package:library_manager/library_manager.dart';

void main() {
  final cliSystem = LibrarySystemCli(
    system: LibrarySystem(items: []),
    inputHandler: InputHandler(),
    libraryView: LibraryView(),
  );
  cliSystem.start();
}
