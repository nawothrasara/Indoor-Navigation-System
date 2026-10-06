import 'package:flutter/material.dart';

import '../models/setup_config.dart';
import 'setup_coverage_page.dart';

class SetupPlacePage extends StatefulWidget {
  const SetupPlacePage({super.key});

  @override
  State<SetupPlacePage> createState() => _SetupPlacePageState();
}

class _SetupPlacePageState extends State<SetupPlacePage> {
  PlaceType? _selected;

  static const _icons = {
    PlaceType.shoppingMall: Icons.storefront,
    PlaceType.hospital: Icons.local_hospital,
    PlaceType.university: Icons.school,
    PlaceType.airport: Icons.flight,
    PlaceType.office: Icons.business,
    PlaceType.museum: Icons.museum,
    PlaceType.other: Icons.apartment,
  };

  void _next() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SetupCoveragePage(
          config: SetupConfig(place: _selected),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Setup · Step 1 of 3')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Where will the app be used?',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  for (final place in PlaceType.values)
                    Card(
                      color: _selected == place
                          ? theme.colorScheme.primaryContainer
                          : null,
                      child: ListTile(
                        leading: Icon(_icons[place]),
                        title: Text(place.label),
                        subtitle: Text(place.description),
                        trailing: _selected == place
                            ? Icon(Icons.check_circle,
                                color: theme.colorScheme.primary)
                            : null,
                        onTap: () => setState(() => _selected = place),
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
                  onPressed: _selected == null ? null : _next,
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
