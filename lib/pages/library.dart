import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => LlibraryPageState();
}

class LlibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Colors.blueAccent[100],
                          indicatorColor: Colors.blueAccent[100],
                          dividerColor: Colors.blueAccent[100],
                          tabs: const <Widget>[
                            Tab(text: "Filter"),
                            Tab(text: "Sort"),
                            Tab(text: "Display"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(children: <Widget>[
                            ListView(
                              children: [
                                MultiRadioButton(
                                  title: const Text("Downloaded"),
                                  onChanged: (value) {},
                                ),
                                MultiRadioButton(
                                  title: const Text("Unread"),
                                  onChanged: (value) {},
                                ),
                                MultiRadioButton(
                                  title: const Text("Started"),
                                  onChanged: (value) {},
                                ),
                                MultiRadioButton(
                                  title: const Text("Bookmarked"),
                                  onChanged: (value) {},
                                ),
                                MultiRadioButton(
                                  title: const Text("Completed"),
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            ListView(
                              children: const [],
                            ),
                            ListView(
                              children: [
                                const ListTile(title: Text("Display mode")),
                                MyRadioButtonList(
                                  onChanged: (value) {},
                                ),
                                const ListTile(title: Text("Badges")),
                                MyRadioButton(
                                  title: const Text("Downloaded chapters"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                                MyRadioButton(
                                  title: const Text("Local source"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                                MyRadioButton(
                                  title: const Text("Language"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                                const ListTile(title: Text("Tabs")),
                                MyRadioButton(
                                  title: const Text("Show category tabs"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                                MyRadioButton(
                                  title: const Text("Show number of items"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                                const ListTile(title: Text("Other")),
                                MyRadioButton(
                                  title: const Text(
                                      "Show continue reading button"),
                                  inactiveIcon: const Icon(
                                      Icons.check_box_outline_blank_rounded),
                                  activeIcon: Icon(
                                    Icons.check_box_rounded,
                                    color: Colors.blueAccent[100],
                                  ),
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ]),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("Global Update"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Text("Open random entry"),
                  onTap: () {},
                )
              ];
            },
          ),
        ],
        backgroundColor: Colors.grey[900],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Library"),
            Text("Temporary"),
          ],
        ),
      ),
    );
  }
}

class MyRadioButton extends StatefulWidget {
  final Widget title;
  final Icon? inactiveIcon;
  final Icon? activeIcon;
  final bool? defaultstate;
  final void Function(bool) onChanged;
  const MyRadioButton(
      {required this.title,
      this.inactiveIcon,
      this.activeIcon,
      this.defaultstate,
      required this.onChanged,
      super.key});
  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  late bool value;
  @override
  void initState() {
    super.initState();
    value = widget.defaultstate ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: value ? activeIcon() : inactiveIcon(),
      title: widget.title,
      onTap: () {
        setState(() {
          value = !value;
          widget.onChanged.call(value);
        });
      },
    );
  }

  Widget inactiveIcon() {
    return widget.inactiveIcon ?? const Icon(Icons.radio_button_off);
  }

  Widget activeIcon() {
    return widget.activeIcon ?? const Icon(Icons.radio_button_on);
  }
}

class MultiRadioButton extends StatefulWidget {
  final Widget title;
  final int? value;
  final void Function(int) onChanged;
  const MultiRadioButton(
      {required this.title, this.value, required this.onChanged, super.key});

  @override
  State<MultiRadioButton> createState() => _MultiRadioButtonState();
}

class _MultiRadioButtonState extends State<MultiRadioButton> {
  late int index;
  @override
  void initState() {
    super.initState();
    int tempind = widget.value ?? 0;
    if (tempind >= 0 && tempind <= 2) {
      index = tempind;
    } else {
      index = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: radioIcon(),
      title: widget.title,
      onTap: () {
        int temp;
        if (index == 0) {
          temp = 1;
        } else {
          if (index == 1) {
            temp = 2;
          } else {
            temp = 0;
          }
        }
        setState(() {
          index = temp;
          widget.onChanged.call(index);
        });
      },
    );
  }

  Widget radioIcon() {
    switch (index) {
      case 0:
        return const Icon(Icons.check_box_outline_blank_rounded);
      case 1:
        return Icon(
          Icons.check_box_rounded,
          color: Colors.blueAccent[100],
        );
      case 2:
        return Icon(
          Icons.disabled_by_default_rounded,
          color: Colors.blueAccent[100],
        );
      default:
        return const Icon(Icons.check_box_outline_blank_rounded);
    }
  }
}

class MyRadioButtonList extends StatefulWidget {
  final Icon? activeIcon;
  final Icon? inactiveIcon;
  final int? value;
  final void Function(int) onChanged;
  const MyRadioButtonList(
      {required this.onChanged,
      this.activeIcon,
      this.inactiveIcon,
      this.value,
      super.key});

  @override
  State<MyRadioButtonList> createState() => _MyRadioButtonListState();
}

class _MyRadioButtonListState extends State<MyRadioButtonList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget inactiveIcon() {
    return widget.inactiveIcon ?? const Icon(Icons.radio_button_off);
  }

  Widget activeIcon() {
    return widget.activeIcon ?? const Icon(Icons.radio_button_on);
  }
}
