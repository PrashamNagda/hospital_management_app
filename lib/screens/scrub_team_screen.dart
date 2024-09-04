import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/scrub_team_bloc.dart';

class ScrubTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrub Team'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ScrubTeamBloc(),
        child: ScrubTeamForm(),
      ),
    );
  }
}

class ScrubTeamForm extends StatefulWidget {
  @override
  _ScrubTeamFormState createState() => _ScrubTeamFormState();
}

class _ScrubTeamFormState extends State<ScrubTeamForm> {
  String? selectedTaskType;
  String? selectedExpenseType;

  // Variables to store the details for "Travelling" and "Food" fields
  String? selectedTransportMode;
  String fromLocation = '';
  String toLocation = '';
  String travelAmount = '';
  String foodAmount = '';

  final List<String> taskTypes = ['WASHUP', 'ASSIST'];
  final List<String> expenseTypes = ['Travelling', 'Food'];
  final List<String> transportModes = [
    'Car',
    'Bike',
    'Public Transport',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Task Type Dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Task Type'),
            value: selectedTaskType,
            items: taskTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedTaskType = value;
              });
            },
          ),
          const SizedBox(height: 16),

          // Expenses Dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Expenses'),
            value: selectedExpenseType,
            items: expenseTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedExpenseType = value;
              });
            },
          ),
          const SizedBox(height: 16),

          // Dynamically display additional fields based on the selected expense type
          if (selectedExpenseType == 'Travelling') ...[
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Mode of Transport'),
              value: selectedTransportMode,
              items: transportModes.map((String mode) {
                return DropdownMenuItem<String>(
                  value: mode,
                  child: Text(mode),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTransportMode = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'From'),
                    onChanged: (value) {
                      setState(() {
                        fromLocation = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'To'),
                    onChanged: (value) {
                      setState(() {
                        toLocation = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    onChanged: (value) {
                      setState(() {
                        travelAmount = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Handle photo upload for travel receipt
                  },
                ),
              ],
            ),
          ] else if (selectedExpenseType == 'Food') ...[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    onChanged: (value) {
                      setState(() {
                        foodAmount = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Handle photo upload for food receipt
                  },
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle form submission or other actions
            },
            child: const Text('Upload Photo'),
          ),
        ],
      ),
    );
  }
}
