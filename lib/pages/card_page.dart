import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scratcher/scratcher.dart';

class CardPage extends StatefulWidget {
  final String type;

  const CardPage({super.key, required this.type});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final GlobalKey<ScratcherState> _scratcherKey = GlobalKey<ScratcherState>();
  List<String> messages = [];
  String randomMessage = '';
  bool isLoading = true;
  bool thresholdReached = false; // To track if the scratch threshold is reached
  double progress = 0; // To track scratch progress
  int _clipKey = 0; // Key for AnimatedSwitcher transition

  Future<List<String>> getJsonData(String type) async {
    String jsonString = await rootBundle.loadString('assets/cards.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    List<String> cards = List<String>.from(jsonData[type]);
    return cards;
  }

  void pickRandomMessage() {
    if (messages.isNotEmpty) {
      final random = Random();
      int randomIndex = random.nextInt(messages.length);
      setState(() {
        randomMessage = messages[randomIndex];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getJsonData(widget.type).then((loadedData) {
      setState(() {
        messages = loadedData;
        pickRandomMessage(); // Pick a random message after data is loaded
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF5B4FB1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Raspe!', style: TextStyle(color: Colors.white, fontSize: 32)),

            const SizedBox(height: 50),

            if (isLoading)
              const CircularProgressIndicator(
                color: Colors.white,
              )
            else
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500), // Transition duration
                child: ClipRRect(
                  key: ValueKey<int>(_clipKey), // Unique key for transition
                  borderRadius: BorderRadius.circular(18),
                  child: Scratcher(
                    key: _scratcherKey,
                    brushSize: 40, // Size of the scratch brush
                    threshold: 50, // Percentage of area to scratch to reveal the message
                    image: Image.asset(
                      'assets/images/background.jpg', // Background image for the scratcher
                      fit: BoxFit.cover,
                    ),
                    onThreshold: () {
                      setState(() {
                        thresholdReached = true; // Called when the threshold is reached
                      });
                    },
                    onChange: (value) {
                      setState(() {
                        progress = value; // Track scratch progress
                      });
                    },
                    // onScratchStart: () {
                    //   print("Scratching has started");
                    // },
                    // onScratchUpdate: () {
                    //   print("Scratching in progress");
                    // },
                    // onScratchEnd: () {
                    //   print("Scratching has finished");
                    // },
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.4,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          randomMessage,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white, // Text color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
        
            const SizedBox(height: 40),
        
            SizedBox(
              height: 70,
              child: Visibility(
                visible: thresholdReached,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      thresholdReached = false;
                      progress = 0;
                      _scratcherKey.currentState?.reset();
                      pickRandomMessage();
                      _clipKey++; // Change the key to trigger the transition
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text(
                    'Nova carta',
                    style: TextStyle(
                      color: Color(0xFF5B4FB1),
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}