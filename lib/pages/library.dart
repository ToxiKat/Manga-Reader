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
                              children: [
                                SortTab(
                                  onChanged: (val) {},
                                ),
                              ],
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
  late bool first, second, third, fourth;
  late int mainval;
  @override
  void initState() {
    super.initState();
    mainval = widget.value ?? 0;
    switch (mainval) {
      case 0:
        first = true;
        second = false;
        third = false;
        fourth = false;
      case 1:
        first = false;
        second = true;
        third = false;
        fourth = false;
      case 2:
        first = false;
        second = false;
        third = true;
        fourth = false;
      case 3:
        first = false;
        second = false;
        third = false;
        fourth = true;
      default:
        first = true;
        second = false;
        third = false;
        fourth = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: first ? activeIcon() : inactiveIcon(),
          title: const Text("Compact grid"),
          onTap: () {
            setState(() {
              first = true;
              second = false;
              third = false;
              fourth = false;
              if (mainval != 0) {
                mainval = 0;
                widget.onChanged.call(mainval);
              }
            });
          },
        ),
        ListTile(
          leading: second ? activeIcon() : inactiveIcon(),
          title: const Text("Comfortable grid"),
          onTap: () {
            setState(() {
              first = false;
              second = true;
              third = false;
              fourth = false;
              if (mainval != 1) {
                mainval = 1;
                widget.onChanged.call(mainval);
              }
            });
          },
        ),
        ListTile(
          leading: third ? activeIcon() : inactiveIcon(),
          title: const Text("Cover-only grid"),
          onTap: () {
            setState(() {
              first = false;
              second = false;
              third = true;
              fourth = false;
              if (mainval != 2) {
                mainval = 2;
                widget.onChanged.call(mainval);
              }
            });
          },
        ),
        ListTile(
          leading: fourth ? activeIcon() : inactiveIcon(),
          title: const Text("List"),
          onTap: () {
            setState(() {
              first = false;
              second = false;
              third = false;
              fourth = true;
              if (mainval != 3) {
                mainval = 3;
                widget.onChanged.call(mainval);
              }
            });
          },
        ),
      ],
    );
  }

  Widget inactiveIcon() {
    return widget.inactiveIcon ?? const Icon(Icons.radio_button_off);
  }

  Widget activeIcon() {
    return widget.activeIcon ??
        Icon(
          Icons.radio_button_on,
          color: Colors.blueAccent[100],
        );
  }
}

class SortTab extends StatefulWidget {
  final int? value;
  final Function(Map<int, int>) onChanged;
  const SortTab({required this.onChanged, this.value, super.key});

  @override
  State<SortTab> createState() => _SortTabState();
}

class _SortTabState extends State<SortTab> {
  late bool first, second, third, fourth, fifth, sixth, seventh, eigth;
  late int mainval;
  bool firstval = false,
      secondval = false,
      thirdval = false,
      fourthval = false,
      fifthval = false,
      sixthval = false,
      seventhval = false,
      eigthval = false;
  @override
  void initState() {
    super.initState();
    mainval = widget.value ?? 0;
    switch (mainval) {
      case 0:
        first = true;
        second = false;
        third = false;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = false;
      case 1:
        first = false;
        second = true;
        third = false;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = false;
      case 2:
        first = false;
        second = false;
        third = true;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = false;
      case 3:
        first = false;
        second = false;
        third = false;
        fourth = true;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = false;
      case 4:
        first = false;
        second = false;
        third = false;
        fourth = false;
        fifth = true;
        sixth = false;
        seventh = false;
        eigth = false;
      case 5:
        first = false;
        second = false;
        third = false;
        fourth = false;
        fifth = false;
        sixth = true;
        seventh = false;
        eigth = false;
      case 6:
        first = false;
        second = false;
        third = false;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = true;
        eigth = false;
      case 7:
        first = false;
        second = false;
        third = false;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = true;
      default:
        first = true;
        second = false;
        third = false;
        fourth = false;
        fifth = false;
        sixth = false;
        seventh = false;
        eigth = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: first ? activeIcon(firstval) : inactiveIcon(),
          title: const Text("Alphabetically"),
          onTap: () {
            setState(
              () {
                if (mainval != 0) {
                  first = true;
                  second = false;
                  third = false;
                  fourth = false;
                  fifth = false;
                  sixth = false;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 0;
                  widget.onChanged.call({mainval: 0});
                } else {
                  firstval = !firstval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: second ? activeIcon(secondval) : inactiveIcon(),
          title: const Text("Last read"),
          onTap: () {
            setState(
              () {
                if (mainval != 1) {
                  first = false;
                  second = true;
                  third = false;
                  fourth = false;
                  fifth = false;
                  sixth = false;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 1;
                  widget.onChanged.call({mainval: 0});
                } else {
                  secondval = !secondval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: third ? activeIcon(thirdval) : inactiveIcon(),
          title: const Text("Last update check"),
          onTap: () {
            setState(
              () {
                if (mainval != 2) {
                  first = false;
                  second = false;
                  third = true;
                  fourth = false;
                  fifth = false;
                  sixth = false;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 2;
                  widget.onChanged.call({mainval: 0});
                } else {
                  thirdval = !thirdval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: fourth ? activeIcon(fourthval) : inactiveIcon(),
          title: const Text("Unread count"),
          onTap: () {
            setState(
              () {
                if (mainval != 3) {
                  first = false;
                  second = false;
                  third = false;
                  fourth = true;
                  fifth = false;
                  sixth = false;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 3;
                  widget.onChanged.call({mainval: 0});
                } else {
                  fourthval = !fourthval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: fifth ? activeIcon(fifthval) : inactiveIcon(),
          title: const Text("Total chapters"),
          onTap: () {
            setState(
              () {
                if (mainval != 4) {
                  first = false;
                  second = false;
                  third = false;
                  fourth = false;
                  fifth = true;
                  sixth = false;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 4;
                  widget.onChanged.call({mainval: 0});
                } else {
                  fifthval = !fifthval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: sixth ? activeIcon(sixthval) : inactiveIcon(),
          title: const Text("Latest chapter"),
          onTap: () {
            setState(
              () {
                if (mainval != 5) {
                  first = false;
                  second = false;
                  third = false;
                  fourth = false;
                  fifth = false;
                  sixth = true;
                  seventh = false;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 5;
                  widget.onChanged.call({mainval: 0});
                } else {
                  sixthval = !sixthval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: seventh ? activeIcon(seventhval) : inactiveIcon(),
          title: const Text("Chapter fetch date"),
          onTap: () {
            setState(
              () {
                if (mainval != 6) {
                  first = false;
                  second = false;
                  third = false;
                  fourth = false;
                  fifth = false;
                  sixth = false;
                  seventh = true;
                  eigth = false;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 6;
                  widget.onChanged.call({mainval: 0});
                } else {
                  seventhval = !seventhval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
        ListTile(
          leading: eigth ? activeIcon(eigthval) : inactiveIcon(),
          title: const Text("Date added"),
          onTap: () {
            setState(
              () {
                if (mainval != 7) {
                  first = false;
                  second = false;
                  third = false;
                  fourth = false;
                  fifth = false;
                  sixth = false;
                  seventh = false;
                  eigth = true;
                  firstval = false;
                  secondval = false;
                  thirdval = false;
                  fourthval = false;
                  fifthval = false;
                  sixthval = false;
                  seventhval = false;
                  eigthval = false;
                  mainval = 7;
                  widget.onChanged.call({mainval: 0});
                } else {
                  eigthval = !eigthval;
                  widget.onChanged.call({mainval: 1});
                }
              },
            );
          },
        ),
      ],
    );
  }

  Widget activeIcon(bool val) {
    if (!val) {
      return Icon(
        Icons.arrow_upward,
        color: Colors.blueAccent[100],
      );
    } else {
      return Icon(
        Icons.arrow_downward,
        color: Colors.blueAccent[100],
      );
    }
  }

  Widget inactiveIcon() {
    return const Icon(Icons.clear, color: Colors.transparent);
  }
}
