import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterTest')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.flutter_dash, size: 72),
              const SizedBox(height: 20),
              const Text('Built with CodeForge', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 12),
              const Text('Edited Text to make sure it works.'),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => const DetailsScreen(),
                  ));
                },
                child: const Text('Open details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
