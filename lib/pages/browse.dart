import 'package:flutter/material.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentindex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Widget> _appbarActions() {
    switch (currentindex) {
      case 0:
        return [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.travel_explore),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          )
        ];
      case 1:
        return [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          )
        ];
      case 2:
        return [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          )
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Browse"),
        backgroundColor: Colors.grey[900],
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.blueAccent[100],
          labelColor: Colors.blueAccent[100],
          controller: _tabController,
          indicatorPadding: const EdgeInsets.only(left: 50.0, right: 50.0),
          indicatorWeight: 4.0,
          onTap: (index) {
            setState(() {
              currentindex = _tabController.index;
            });
          },
          tabs: const <Widget>[
            Tab(text: "Sources"),
            Tab(text: "Extensions"),
            Tab(text: "Migrate"),
          ],
        ),
        actions: _appbarActions(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sources"),
                Text("Temporary"),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Extensions"),
                Text("Temporary"),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Migrate"),
                Text("Temporary"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
