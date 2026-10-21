import 'package:flutter/material.dart';

// Exercise 3.4 - Column, Row, Expanded
// Run separately from the other exercises with:
//   flutter run -t lib/layout_exercise.dart

void main() => runApp(const LayoutExerciseApp());

class LayoutExerciseApp extends StatelessWidget {
  const LayoutExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 3.4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LayoutPage(),
    );
  }
}

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3.4'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1) Column with 3 Texts and different mainAxisAlignment values
          const _SectionTitle('1) Column: mainAxisAlignment'),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ColumnDemo(
                  label: 'start',
                  alignment: MainAxisAlignment.start,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _ColumnDemo(
                  label: 'center',
                  alignment: MainAxisAlignment.center,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _ColumnDemo(
                  label: 'spaceBetween',
                  alignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ],
          ),

          // 2) Row with an Icon and a Text, crossAxisAlignment.center
          const _SectionTitle('2) Row: crossAxisAlignment.center'),
          Container(
            color: Colors.amber.shade100,
            padding: const EdgeInsets.all(8),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wysiwyg, size: 48),
                SizedBox(width: 12),
                Text('hallooooooo', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          // 3) Row with 2 Containers and Expanded
          const _SectionTitle('3) Row + Expanded'),
          const Text('One fixed (100 px) + one Expanded: takes the remaining space'),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(width: 100, height: 60, color: Colors.red.shade300),
              Expanded(
                child: Container(height: 60, color: Colors.blue.shade300),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Expanded (flex 1) + Expanded (flex: 2): 1/3 and 2/3'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(height: 60, color: Colors.red.shade300),
              ),
              Expanded(
                flex: 2,
                child: Container(height: 60, color: Colors.blue.shade300),
              ),
            ],
          ),

          // 4) Mixed layout: Column > header Row + Expanded content
          const _SectionTitle('4) Mixed layout'),
          Container(
            height: 260,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.indigo.shade100,
                  padding: const EdgeInsets.all(12),
                  child: const Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 8),
                      Text(
                        'Header',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.teal.shade200,
                    alignment: Alignment.center,
                    child: const Text('Content area'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A fixed-height Column with title, subtitle and description,
/// so the effect of mainAxisAlignment is visible.
class _ColumnDemo extends StatelessWidget {
  final String label;
  final MainAxisAlignment alignment;

  const _ColumnDemo({required this.label, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Column(
            mainAxisAlignment: alignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Subtitle', style: TextStyle(fontSize: 14)),
              Text('Description', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
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