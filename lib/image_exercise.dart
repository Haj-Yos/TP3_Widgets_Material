import 'package:flutter/material.dart';

// Exercise 3.2 - Image widget
// Run separately from exercise 3.1 with:
//   flutter run -t lib/image_exercise.dart

void main() => runApp(const ImageExerciseApp());

class ImageExerciseApp extends StatelessWidget {
  const ImageExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 3.2 - Image',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ImagePage(),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  static const String _url = 'https://picsum.photos/600/400';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1) Image from a URL
          const _SectionTitle('1) Image.network'),
          Image.network(
            _url,
            height: 200,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),

          // 2) Local image (assets/images/logo.png)
          const _SectionTitle('2) Image.asset'),
          Image.asset(
            'assets/images/logo.png',
            height: 120,
          ),

          // 3) Network unavailable -> errorBuilder
          //    Same URL as step 1. To see the fallback, turn off your
          //    Wi-Fi / network and restart the app.
          const _SectionTitle('3) Image.network with errorBuilder'),
          Image.network(
            _url,
            height: 120,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 120,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.wifi_off, size: 36),
                    SizedBox(height: 8),
                    Text('Image unavailable'),
                  ],
                ),
              );
            },
          ),

          // 4) BoxFit comparison in a fixed-size Container
          const _SectionTitle('4) BoxFit: cover / contain / fill'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _FitBox(label: 'cover', fit: BoxFit.cover, url: _url),
              _FitBox(label: 'contain', fit: BoxFit.contain, url: _url),
              _FitBox(label: 'fill', fit: BoxFit.fill, url: _url),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _FitBox extends StatelessWidget {
  final String label;
  final BoxFit fit;
  final String url;

  const _FitBox({required this.label, required this.fit, required this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.indigo, width: 2),
          ),
          child: Image.network(url, fit: fit),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}