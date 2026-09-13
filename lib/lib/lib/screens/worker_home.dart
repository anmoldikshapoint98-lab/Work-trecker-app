import 'package:flutter/material.dart';

import 'attendance_screen.dart';
import 'work_report_screen.dart';
import 'my_reports_screen.dart';

class WorkerHome extends StatelessWidget {
  const WorkerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WORK TRACKER'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                'Welcome, Worker',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Daily Field Work Panel'),
            ),
          ),

          const SizedBox(height: 12),

          _menu(
            context,
            'Attendance',
            'Present / Absent / Half Day / Leave',
            Icons.event_available,
            const AttendanceScreen(),
          ),

          _menu(
            context,
            'Daily Work Report',
            'Work + Location + Machine + Material',
            Icons.assignment,
            const WorkReportScreen(),
          ),

          _menu(
            context,
            'My Reports',
            'अपने submitted reports देखें',
            Icons.history,
            const MyReportsScreen(),
          ),
        ],
      ),
    );
  }

  static Widget _menu(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 34),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
