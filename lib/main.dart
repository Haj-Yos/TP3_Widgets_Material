import 'package:flutter/material.dart';

void main() => runApp(const WidgetsDemo());

class WidgetsDemo extends StatelessWidget {
  const WidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text(
              'Bonjour LocalSwap',
              style: TextStyle(
                fontSize: 28,                  
                fontWeight: FontWeight.bold,  
                color: Color.fromARGB(255, 4, 99, 89),           
                fontStyle: FontStyle.italic,   
              ),
            ),
            const SizedBox(height: 24),

            Container(
              width: 250,
              color: const Color.fromARGB(255, 89, 119, 179),
              child: const Text(
                'Hallooo Im Hajji YOsra!!!!!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}