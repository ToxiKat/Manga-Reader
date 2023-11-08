import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'pages/library.dart';
import 'pages/updates.dart';
import 'pages/history.dart';
import 'pages/browse.dart';
import 'pages/more.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manga Reader',
      theme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Manga Reader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  final List<Widget> _pages = <Widget>[
    const LibraryPage(),
    const UpdatesPage(),
    const HistoryPage(),
    const BrowsePage(),
    const MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF25282d),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Color(0xFF25282d),
            icon: Icon(
              Icons.collections_bookmark_outlined,
              color: Colors.white,
            ),
            label: "Library",
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF25282d),
            icon: Icon(
              MdiIcons.alertDecagramOutline,
              color: Colors.white,
            ),
            label: "Updates",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xFF25282d),
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            label: "History",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xFF25282d),
            icon: Icon(
              Icons.explore_outlined,
              color: Colors.white,
            ),
            label: "Browse",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Color(0xFF25282d),
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            label: "More",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
      body: _pages.elementAt(_selectedPage),
    );
  }
}
