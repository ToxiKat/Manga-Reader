import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool downloadOnly = false;
  bool incognito = false;

  void _launchUrl(openUrl) async {
    final Uri url = Uri.parse(openUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud_off),
            title: const Text("Downloaded only"),
            subtitle: const Text("Filter all entries in your library"),
            trailing: Switch(
              value: downloadOnly,
              onChanged: (value) {
                setState(() {
                  downloadOnly = !downloadOnly;
                });
              },
              activeColor: Colors.blueAccent[100],
            ),
            onTap: () {
              setState(() {
                downloadOnly = !downloadOnly;
              });
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: Icon(MdiIcons.glasses),
            title: const Text("Incognito mode"),
            subtitle: const Text("Pauses reading history"),
            trailing: Switch(
              value: incognito,
              onChanged: (value) {
                setState(() {
                  incognito = !incognito;
                });
              },
              activeColor: Colors.blueAccent[100],
            ),
            onTap: () {
              setState(() {
                incognito = !incognito;
              });
            },
            iconColor: Colors.blueAccent[100],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: const Text("Download queue"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DownloadPage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: const Icon(Icons.label_outline_rounded),
            title: const Text("Categories"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesPage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: const Icon(Icons.query_stats),
            title: const Text("Statistics"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatisticsPage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: const Icon(Icons.settings_backup_restore),
            title: const Text("Backup and Restore"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BackupRestorePage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            iconColor: Colors.blueAccent[100],
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help"),
            onTap: () {
              _launchUrl("https://github.com/ToxiKat/Manga-Reader#readme");
            },
            iconColor: Colors.blueAccent[100],
          ),
        ],
      ),
    );
  }
}

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String _randomface() {
    List<String> faces = [
      "(っ °Д °;)っ",
      "＞︿＜",
      "o(￣┰￣*)ゞ",
      "<(＿　＿)>",
      "(#｀-_ゝ-)",
      "（＞人＜；）",
      "≡(▔﹏▔)≡",
      "⊙﹏⊙∥",
    ];
    String face = (faces..shuffle()).first;
    return face;
  }

  Widget _fetchDownloads() {
    List<Widget> downloads = [];
    if (downloads.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_randomface(), style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 16),
            const Text("No Downloads"),
          ],
        ),
      );
    } else {
      return ListView(
        children: downloads,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Download queue"),
      ),
      body: _fetchDownloads(),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Categories"),
      ),
    );
  }
}

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
      ),
    );
  }
}

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  State<BackupRestorePage> createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backup and Restore"),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text("general"),
            subtitle: const Text("App language, notifications"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text("Appearance"),
            subtitle: const Text("Theme, date & time format"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.collections_bookmark_outlined),
            title: const Text("Library"),
            subtitle: const Text("Categories, global update"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.chrome_reader_mode_outlined),
            title: const Text("Reader"),
            subtitle: const Text("Reading mode, display, navigations"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: const Text("Downloads"),
            subtitle: const Text("Automatic download, download ahead"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text("Tracking"),
            subtitle: const Text("One-way progress sync, enhanced sync"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.explore_outlined),
            title: const Text("Browse"),
            subtitle: const Text("Sources, extensions, global search"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_backup_restore),
            title: const Text("Backup and restore"),
            subtitle: const Text("Manual & automatic backups"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text("Security"),
            subtitle: const Text("App lock, security screen"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("Advanced"),
            subtitle: const Text("Dump crash logs, battery optimizations"),
            iconColor: Colors.blueAccent[100],
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            subtitle: const Text("Name preview releasenumber"),
            iconColor: Colors.blueAccent[100],
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: ListView(
        children: [
          const Divider(),
          ListTile(
            title: const Text("Version"),
            subtitle: const Text("Name preview releasenumber"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Check for updates"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("What's new"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Help translate"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Open source licenses"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Privacy policy"),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.public),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.discord),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(MdiIcons.twitter),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reddit),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(MdiIcons.github),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
