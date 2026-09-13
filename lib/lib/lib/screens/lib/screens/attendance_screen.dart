import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String status = 'Present';
  bool loading = false;

  void submitAttendance() {
    setState(() => loading = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() => loading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Attendance: $status submitted',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: status,
              decoration: const InputDecoration(
                labelText: 'Attendance Status',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Present',
                  child: Text('Present'),
                ),
                DropdownMenuItem(
                  value: 'Absent',
                  child: Text('Absent'),
                ),
                DropdownMenuItem(
                  value: 'Half Day',
                  child: Text('Half Day'),
                ),
                DropdownMenuItem(
                  value: 'Leave',
                  child: Text('Leave'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => status = value);
                }
              },
            ),

            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('GPS Location'),
              subtitle: Text(
                'Submit करते समय current GPS save होगा',
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    loading ? null : submitAttendance,
                icon: const Icon(Icons.send),
                label: Text(
                  loading
                      ? 'Submitting...'
                      : 'SUBMIT ATTENDANCE',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
