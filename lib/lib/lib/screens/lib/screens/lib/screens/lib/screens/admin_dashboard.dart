import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADMIN DASHBOARD'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Admin: Manish Kumar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _StatCard(
                title: 'Workers',
                value: '4',
                icon: Icons.people,
              ),
              _StatCard(
                title: 'Present',
                value: '0',
                icon: Icons.check_circle,
              ),
              _StatCard(
                title: 'Absent',
                value: '0',
                icon: Icons.cancel,
              ),
              _StatCard(
                title: 'Reports',
                value: '0',
                icon: Icons.assignment,
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Today Attendance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.event_available),
              title: Text('No attendance yet'),
              subtitle: Text(
                'आज की attendance यहाँ दिखाई देगी।',
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Today Work Reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.assignment),
              title: Text('No work reports yet'),
              subtitle: Text(
                'आज के सभी workers के reports यहाँ आएँगे।',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
