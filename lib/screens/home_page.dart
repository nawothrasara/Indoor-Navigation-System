import 'package:flutter/material.dart';

import '../models/setup_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.config});

  final SetupConfig config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Indoor Navigation')),
      body: Center(
        child: Text(
          'Welcome, Guest!\n'
          '${config.place?.label} · ${config.floors} floor(s)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
