import 'package:flutter/material.dart';
import 'habit.dart';
import 'add_habit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Habit> habits = [];

  void goToAdd() async {
    final result = await Navigator.push<Habit>(
      context,
      MaterialPageRoute(builder: (_) => const AddHabitPage()),
    );
    if (result != null) {
      setState(() {
        habits.add(result);
      });
    }
  }

  void toggle(Habit h) {
    setState(() {
      h.toggleToday();
    });
  }

  void removeHabit(Habit h) {
    setState(() {
      habits.remove(h);
    });
  }

  @override
  Widget build(BuildContext context) {
    for (final h in habits) {
      h.newDayCheck();
    }
    final total = habits.length;
    final done = habits.where((h) => h.doneToday).length;

    return Scaffold(
      appBar: AppBar(title: const Text('HabiTrack')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: StatCard(title: 'Total', value: '$total')),
                Expanded(child: StatCard(title: 'Aujourd’hui', value: '$done')),
              ],
            ),
          ),
          Expanded(
            child: habits.isEmpty
                ? const Center(child: Text('Ajoutez une habitude en cliquant sur le bouton ci-dessous'))
                : ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, i) {
                final h = habits[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(h.name),
                    subtitle: Text('Série: ${h.streak}'),
                    leading: Checkbox(
                      value: h.doneToday,
                      onChanged: (_) => toggle(h),
                    ),
                    trailing: IconButton(
                      onPressed: () => removeHabit(h),
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () => toggle(h),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: goToAdd,
                child: const Text('Ajouter une habitude'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
