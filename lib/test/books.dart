import 'dart:io';
// import 'dart:typed_data';
import 'package:epubx/epubx.dart' as ebook;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;

class Epubbook {
  String imagePath;
  String title;
  String author;
  Epubbook({
    required this.imagePath,
    required this.title,
    required this.author,
  });
}

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  List<String> books = [];
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                pickFolder();
              },
              icon: const Icon(Icons.folder_open_rounded))
        ],
      ),
      body: books.isEmpty
          ? const Center(child: Text("Empty"))
          : EpubGrid(epubPaths: books),
    );
  }

  Future<void> pickFolder() async {
    String? folderPath = await FilePicker.platform.getDirectoryPath();
    String loc = folderPath ?? "";
    if (loc.isEmpty) {
      setState(() {
        isOpen = false;
      });
    } else {
      setState(() {
        isOpen = true;
      });
      listEpubFiles(loc);
    }
  }

  void listEpubFiles(String folderPath) {
    try {
      Directory folder = Directory(folderPath);
      List<FileSystemEntity> files = folder.listSync();
      List<File> epubFiles = files
          .where((entity) =>
              entity is File && entity.path.toLowerCase().endsWith('.epub'))
          .map((entity) => entity as File)
          .toList();
      List<String> temp = [];
      for (File epubFile in epubFiles) {
        temp.add(epubFile.path);
      }
      setState(() {
        books = temp;
      });
    } catch (e) {
      () {};
    }
  }
}

class EpubGrid extends StatefulWidget {
  final List<String> epubPaths;
  const EpubGrid({required this.epubPaths, super.key});

  @override
  State<EpubGrid> createState() => _EpubGridState();
}

class _EpubGridState extends State<EpubGrid> {
  // List<String> books = [];
  @override
  Widget build(BuildContext context) {
    return ListView(children: bookList());
  }

  List<Widget> bookList() {
    List<Widget> books = [];
    for (String epubPath in widget.epubPaths) {
      books.add(EbookTile(epubFilePath: epubPath));
    }
    return books;
  }
}

class EbookTile extends StatelessWidget {
  final String epubFilePath;

  const EbookTile({required this.epubFilePath, Key? key}) : super(key: key);

  Future<ebook.EpubBook> _getEpubBook() async {
    List<int> bytes = await File(epubFilePath).readAsBytes();
    return ebook.EpubReader.readBook(bytes);
  }

  @override
  Widget build(BuildContext context) {
    Image placeholder = Image.file(File("assets/placeholder.jpg"));
    return FutureBuilder<ebook.EpubBook>(
      future: _getEpubBook(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            leading: CircularProgressIndicator(),
          ); // or any loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data available');
        } else {
          ebook.EpubBook epubBook = snapshot.data!;
          String title = epubBook.Title ?? "";
          String author = epubBook.Author ?? "";
          Image coverImage = epubBook.CoverImage as Image? ?? placeholder;

          return ListTile(
            title: Text(title),
            subtitle: Text(author),
          );
        }
      },
    );
  }
}
