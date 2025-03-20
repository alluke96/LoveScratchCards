import 'dart:convert';
import 'dart:math'; // Import for Random number generation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPage extends StatefulWidget {
  final String type;

  const CardPage({super.key, required this.type});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<String> messages = [];
  String randomMessage = '';
  bool isLoading = true;

  Future<List<String>> getJsonData(String type) async {
    String jsonString = await rootBundle.loadString('cards.json');
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
            if (isLoading)
              const CircularProgressIndicator()
            else
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    randomMessage,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            // const SizedBox(height: 20),

            // ElevatedButton(
            //   onPressed: () {
            //     pickRandomMessage();
            //   },
            //   child: const Text('Nova Carta'),
            // ),
          ],
        ),
      ),
    );
  }
}