import 'package:flutter/material.dart';

import '../models/setup_config.dart';
import 'setup_summary_page.dart';

class SetupCoveragePage extends StatefulWidget {
  const SetupCoveragePage({super.key, required this.config});

  final SetupConfig config;

  @override
  State<SetupCoveragePage> createState() => _SetupCoveragePageState();
}

class _SetupCoveragePageState extends State<SetupCoveragePage> {
  static const _limit = 20000.0;

  late SetupConfig _config = widget.config;

  void _onRangeChanged(RangeValues values) {
    setState(() {
      _config = _config.copyWith(
        minArea: values.start,
        maxArea: values.end,
        averageArea: _config.averageArea.clamp(values.start, values.end),
      );
    });
  }

  void _setFloors(int floors) {
    setState(() => _config = _config.copyWith(floors: floors));
  }

  void _next() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SetupSummaryPage(config: _config)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minArea = _config.minArea;
    final maxArea = _config.maxArea;

    return Scaffold(
      appBar: AppBar(title: const Text('Setup · Step 2 of 3')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Text(
                    'Coverage area',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Approximate area of one floor in '
                    '${_config.place?.label ?? 'your place'}.',
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Minimum – Maximum: ${minArea.round()} – ${maxArea.round()} m²',
                    style: theme.textTheme.titleMedium,
                  ),
                  RangeSlider(
                    values: RangeValues(minArea, maxArea),
                    min: 50,
                    max: _limit,
                    divisions: 399,
                    labels: RangeLabels(
                      '${minArea.round()} m²',
                      '${maxArea.round()} m²',
                    ),
                    onChanged: _onRangeChanged,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Average: ${_config.averageArea.round()} m²',
                    style: theme.textTheme.titleMedium,
                  ),
                  Slider(
                    value: _config.averageArea.clamp(minArea, maxArea),
                    min: minArea,
                    max: maxArea > minArea ? maxArea : minArea + 1,
                    label: '${_config.averageArea.round()} m²',
                    onChanged: (v) => setState(
                      () => _config = _config.copyWith(averageArea: v),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Number of floors',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      IconButton.outlined(
                        onPressed: _config.floors > 1
                            ? () => _setFloors(_config.floors - 1)
                            : null,
                        icon: const Icon(Icons.remove),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${_config.floors}',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      IconButton.outlined(
                        onPressed: _config.floors < 100
                            ? () => _setFloors(_config.floors + 1)
                            : null,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _next,
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
