import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<String> messages = [];

  Future<List<String>> getJsonData(String type) async {
    String jsonString = await rootBundle.loadString('cards.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    List<String> cards = List<String>.from(jsonData[type]);
    return cards;
  }

  @override
  void initState() {
    super.initState();
    getJsonData('love').then((loadedData) {
      setState(() {
        messages = loadedData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Selecione uma carta'),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Text(messages[index]);
                },
              ),
            )
          ]
        )
      )
    );
  }
}