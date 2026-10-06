import 'package:flutter/material.dart';

import '../models/setup_config.dart';
import 'home_page.dart';

class SetupSummaryPage extends StatelessWidget {
  const SetupSummaryPage({super.key, required this.config});

  final SetupConfig config;

  void _finish(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomePage(config: config)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Setup · Step 3 of 3')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Text(
                    'Review your setup',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Column(
                      children: [
                        _row('Place', config.place?.label ?? '-'),
                        _row('Minimum area', '${config.minArea.round()} m²'),
                        _row('Average area',
                            '${config.averageArea.round()} m²'),
                        _row('Maximum area', '${config.maxArea.round()} m²'),
                        _row('Floors', '${config.floors}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => _finish(context),
                  child: const Text('Finish setup'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return ListTile(title: Text(label), trailing: Text(value));
  }
}
