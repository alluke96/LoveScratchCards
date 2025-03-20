import 'package:flutter/material.dart';
import 'package:love_scratch_cards/pages/select_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B4FB1),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(69.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Olá Yara,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            
                const SizedBox(height: 20),
            
                const Text(
                  'Seja bem vinda!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
            
                const SizedBox(height: 60),
            
                const Text(
                  'Como você está se sentindo hoje?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
            
                const SizedBox(height: 10),
            
                Expanded(
                  child: Image.asset(
                    'assets/images/capy.png',
                    width: 300,
                    height: 300,
                  ),
                ),
            
                const SizedBox(height: 10),
            
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const SelectPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text(
                    'Vamos começar?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5B4FB1),
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}