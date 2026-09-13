import 'package:flutter/material.dart';

class WorkReportScreen extends StatefulWidget {
  const WorkReportScreen({super.key});

  @override
  State<WorkReportScreen> createState() => _WorkReportScreenState();
}

class _WorkReportScreenState extends State<WorkReportScreen> {
  final locationController = TextEditingController();
  final machineController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController(text: '1');
  final materialController = TextEditingController();
  final remarksController = TextEditingController();

  String workType = 'Machine Installation';
  String workStatus = 'Completed';

  final workTypes = const [
    'Machine Installation',
    'Machine Maintenance',
    'Machine Testing',
    'Wiring',
    'Cable Work',
    'Meter Installation',
    'Inspection',
    'Fault Repair',
    'Material Checking',
    'Other',
  ];

  void submitReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Work report submitted successfully'),
      ),
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    machineController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    materialController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Work Report'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Location / Station',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: machineController,
            decoration: const InputDecoration(
              labelText: 'Machine Number',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            value: workType,
            decoration: const InputDecoration(
              labelText: 'Work Type',
              border: OutlineInputBorder(),
            ),
            items: workTypes.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => workType = value);
              }
            },
          ),

          const SizedBox(height: 12),

          TextField(
            controller: descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Work Description',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Machine Quantity',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: materialController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Material Used',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            value: workStatus,
            decoration: const InputDecoration(
              labelText: 'Work Status',
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Started',
                child: Text('Started'),
              ),
              DropdownMenuItem(
                value: 'In Progress',
                child: Text('In Progress'),
              ),
              DropdownMenuItem(
                value: 'Completed',
                child: Text('Completed'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => workStatus = value);
              }
            },
          ),

          const SizedBox(height: 12),

          TextField(
            controller: remarksController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Remarks',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('GPS Location'),
            subtitle: Text(
              'Submit करते समय current GPS save होगा',
            ),
          ),

          const SizedBox(height: 10),

          FilledButton.icon(
            onPressed: submitReport,
            icon: const Icon(Icons.send),
            label: const Text('SUBMIT WORK REPORT'),
          ),
        ],
      ),
    );
  }
}
