import 'package:flutter/material.dart';
import 'package:net_aware/net_aware.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NetAware(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Net Aware'),
          ),
          body: const Center(
            child: Text('You are Online!'),
          ),
        ),

    );
  }
}
