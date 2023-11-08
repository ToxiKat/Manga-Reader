import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.chrome_reader_mode_outlined),
              title: const Text("My Book"),
              subtitle: const Text("some small info about the book"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BookReaderPage()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              tileColor: Colors.blueGrey[900],
            )
          ],
        ),
      ),
    );
  }
}

class BookReaderPage extends StatefulWidget {
  const BookReaderPage({super.key});

  @override
  State<BookReaderPage> createState() => _BookReaderPageState();
}

class _BookReaderPageState extends State<BookReaderPage> {
  late String story;
  late bool isRunning;
  FlutterTts flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    isRunning = false;
    story =
        """Once upon a time in the quaint village of Eldoria, nestled between rolling hills and whispering trees, lived a young woman named Seraphina. Her days were woven with the threads of routine, yet her heart yearned for the extraordinary. Eldoria was a place where tradition danced with the wind, but Seraphina craved a melody of her own.

One crisp morning, as the sun painted the sky in hues of pink and gold, Seraphina received a mysterious letter. The parchment was worn, edges frayed with time, and sealed with an ornate insignia—a soaring phoenix. Intrigued, she unfurled the letter, revealing an invitation to the Enchanted Masquerade, a fabled event that happened once in a century.

The letter spoke of a hidden realm beyond the Veil of Shadows, accessible only during the celestial convergence that was to occur that very night. Seraphina's heart fluttered with anticipation, and as dusk cloaked the village, she donned a gown spun from stardust and a mask adorned with silver feathers.

Guided by the ethereal glow of fireflies, she ventured into the ancient forest, where trees whispered secrets of forgotten tales. At the edge of the woods, the Veil of Shadows shimmered, and with a hesitant step, she crossed into a realm of enchantment.

The Enchanted Masquerade unfolded like a dream. Creatures of myth and magic twirled in elegant harmony, and the air sparkled with laughter and spells. Seraphina's eyes met those of a masked stranger, and in that moment, time ceased to exist. They danced through constellations, their every step a brushstroke on the canvas of the cosmos.

As the night waned, the stranger revealed himself as Orion, a celestial being bound by duty to the stars. A profound connection unfolded between them, transcending the boundaries of mortal and ethereal. Yet, with the first light of dawn, the enchantment began to fade.

Orion confessed that their meeting was a fleeting gift, a convergence of destinies permitted by the cosmos. With a bittersweet farewell, he faded into the morning mist, leaving Seraphina standing at the threshold of two worlds.

The villagers awoke to find Seraphina in the heart of the forest, her gown and mask now mere remnants of a magical night. Eldoria remained unchanged, unaware of the extraordinary tale that unfolded in the hidden realm.

Seraphina carried the memory of the Enchanted Masquerade in her heart, a secret treasure that illuminated the canvas of her ordinary days. And as the years passed, the village of Eldoria continued to thrive, nestled between rolling hills and whispering trees, where tradition and magic coexisted in the dance of life.""";
  }

  Future<void> speak() async {
    setState(() {
      isRunning = true;
    });
    print("Speaking...");
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(story);
    flutterTts.awaitSpeakCompletion(true);
    setState(() {
      isRunning = false;
    });
    print("stopped...");
  }

  Future<void> stop() async {
    if (isRunning) {
      await flutterTts.stop();
      setState(() {
        isRunning = false;
      });
      print("stopped...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          onPressed: () {
            stop();
            Navigator.of(context).pop();
          },
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          focusElevation: 0.0,
          hoverElevation: 0.0,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          mini: true,
          tooltip: "Back",
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            opticalSize: 10.0,
          ),
        ),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: isRunning
                ? const Icon(
                    Icons.volume_off_rounded,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.volume_up_rounded,
                    color: Colors.white,
                  ),
            onPressed: isRunning
                ? () {
                    stop();
                  }
                : () {
                    speak();
                  },
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        RichText(
          text: TextSpan(text: story),
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
      ]),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}
