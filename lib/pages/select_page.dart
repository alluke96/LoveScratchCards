import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

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
          children: <Widget>[
            const Text(
              'O que mais falta hoje?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 80),

            ElevatedButton(
              onPressed: () {
                // Navigate to the "Amor" card page or perform an action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              ),
              child: const Text(
                'Amor',
                style: TextStyle(
                  color: Color(0xFF5B4FB1),
                  fontSize: 22,
                ),
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                // Navigate to the "Motivação" card page or perform an action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              ),
              child: const Text(
                'Motivação',
                style: TextStyle(
                  color: Color(0xFF5B4FB1),
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}