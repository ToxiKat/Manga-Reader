import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color(0XFF2A2D36),
                    title: const Text("Remove Everything"),
                    content:
                        const Text("Are you sure? All history will be lost."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.blueAccent[100]),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.blueAccent[100]),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_sweep_outlined),
          ),
        ],
        backgroundColor: const Color(0xFF25282d),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("History"),
            Text("Temporary"),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF1B1A1F),
    );
  }
}
