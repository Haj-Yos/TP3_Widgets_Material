import 'package:flutter/material.dart';

// Exercise 3.3 - Container, Padding and Center
// Run separately from the other exercises with:
//   flutter run -t lib/container_exercise.dart

void main() => runApp(const ContainerExerciseApp());

class ContainerExerciseApp extends StatelessWidget {
  const ContainerExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 3.3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ContainerPage(),
    );
  }
}

/// Blue decoration with rounded corners and a shadow.
final BoxDecoration blueCard = BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(16),
  boxShadow: const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ],
);

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3.3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1) Container 200x100, blue, rounded corners + shadow
          const _SectionTitle('1) Container + BoxDecoration'),
          Center(
            child: Container(
              width: 200,
              height: 100,
              decoration: blueCard,
            ),
          ),

          // 2) Padding: all(16) vs symmetric(horizontal: 24, vertical: 8)
          //    The yellow background makes the padding visible.
          const _SectionTitle('2) Padding'),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Hello Flutter'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('Hello Flutter'),
              ),
            ),
          ),

          // 3) Center ON, then Center OFF.
          //    Both areas are the same size (a Stack inside a bordered box),
          //    the only difference is the Center widget.
          const _SectionTitle('3) Center ON'),
          _Area(
            child: Center(
              child: Container(
                width: 200,
                height: 100,
                decoration: blueCard,
              ),
            ),
          ),
          const _SectionTitle('3) Center OFF'),
          _Area(
            child: Container(
              width: 200,
              height: 100,
              decoration: blueCard,
            ),
          ),

          // 4) Center > Padding > Container > Text (mini test card)
          const _SectionTitle('4) Center + Padding + Container + Text'),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                decoration: blueCard,
                child: const Text(
                  'Test card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A fixed-height bordered area so the effect of Center is visible.
/// The Stack gives its child loose constraints, so the child keeps
/// its own 200x100 size and is placed top-left unless wrapped in Center.
class _Area extends StatelessWidget {
  final Widget child;
  const _Area({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Stack(children: [child]),
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