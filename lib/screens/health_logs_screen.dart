import 'package:flutter/material.dart';

class HealthLogsScreen extends StatelessWidget {
  const HealthLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Logs'),
        actions: [
          Semantics(
            button: true,
            label: 'Add new health log',
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _SummaryGrid(),
            const SizedBox(height: 16),
            _HealthLogCard(
              cardKey: Key('bloodPressureCard'),
              title: 'Blood Pressure',
              details: '120/80 mmHg',
              time: '1 hour ago',
            ),
            _HealthLogCard(
              cardKey: Key('moodCheckCard'),
              title: 'Mood Check',
              details: 'Feeling good today',
              time: '2 hours ago',
            ),
            _HealthLogCard(
              cardKey: Key('medicationCard'),
              title: 'Medication Taken',
              details: 'Lisinopril 10mg',
              time: '3 hours ago',
            ),
          ],
        ),
      ),
    );
  }
}

/* ===========================
   PRIVATE WIDGETS
   =========================== */

class _SummaryGrid extends StatelessWidget {
  _SummaryGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // allow GridView to take minimal space
      physics: const NeverScrollableScrollPhysics(), // prevent scrolling conflicts
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        _SummaryCard(title: 'Steps', value: '8,200'),
        _SummaryCard(title: 'Sleep', value: '7h 45m'),
        _SummaryCard(title: 'Heart Rate', value: '72 bpm'),
        _SummaryCard(title: 'Calories', value: '1,900 kcal'),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  _SummaryCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$title summary: $value',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

class _HealthLogCard extends StatelessWidget {
  final Key cardKey;
  final String title;
  final String details;
  final String time;

  _HealthLogCard({
    required this.cardKey,
    required this.title,
    required this.details,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: cardKey, // <-- ensures test can find it
      child: Semantics(
        button: true,
        label: '$title log, $details, recorded $time',
        child: ListTile(
          title: Text(title),
          subtitle: Text(details),
          trailing: Text(time),
          onTap: () {},
        ),
      ),
    );
  }
}



