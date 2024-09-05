import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String? selectedSurgery;
  String surgeonName = '';

  // Variables to store the details for "Travelling" and "Food" fields
  String? selectedTransportMode;
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();
  TextEditingController travelAmountController = TextEditingController();
  TextEditingController foodAmountController = TextEditingController();
  TextEditingController surgeonNameController = TextEditingController();

  final List<String> taskTypes = ['WASHUP', 'ASSIST'];
  final List<String> expenseTypes = ['Travelling', 'Food'];
  final List<String> transportModes = [
    'Car',
    'Bike',
    'Public Transport',
    'Other'
  ];
  final List<String> surgeryTypes = [
    'ACL',
    'RC',
    'Knee Replacement',
    'Hip Replacement'
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  // Load saved data from SharedPreferences
  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTaskType = prefs.getString('selectedTaskType');
      selectedExpenseType = prefs.getString('selectedExpenseType');
      selectedTransportMode = prefs.getString('selectedTransportMode');
      fromLocationController.text = prefs.getString('fromLocation') ?? '';
      toLocationController.text = prefs.getString('toLocation') ?? '';
      travelAmountController.text = prefs.getString('travelAmount') ?? '';
      foodAmountController.text = prefs.getString('foodAmount') ?? '';
      selectedSurgery = prefs.getString('selectedSurgery');
      surgeonNameController.text = prefs.getString('surgeonName') ?? '';
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  void dispose() {
    fromLocationController.dispose();
    toLocationController.dispose();
    travelAmountController.dispose();
    foodAmountController.dispose();
    surgeonNameController.dispose();
    super.dispose();
  }

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
              _saveData('selectedTaskType', value!);
            },
          ),
          const SizedBox(height: 16),

          // Hospital Visited (Upload Photo)
          Row(
            children: [
              Expanded(
                child: Text(
                  'Hospital Visited',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle photo upload for hospital visited
                },
                child: const Text('Upload Photo'),
              ),
            ],
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
              _saveData('selectedExpenseType', value!);
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
                _saveData('selectedTransportMode', value!);
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
                        fromLocationController.text = value;
                      });
                      _saveData('fromLocation', value);
                    },
                    controller: fromLocationController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'To'),
                    onChanged: (value) {
                      setState(() {
                        toLocationController.text = value;
                      });
                      _saveData('toLocation', value);
                    },
                    controller: toLocationController,
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
                        travelAmountController.text = value;
                      });
                      _saveData('travelAmount', value);
                    },
                    controller: travelAmountController,
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
                        foodAmountController.text = value;
                      });
                      _saveData('foodAmount', value);
                    },
                    controller: foodAmountController,
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

          // Surgery Detail Section
          const Text('Surgery Detail', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'What Surgery'),
            value: selectedSurgery,
            items: surgeryTypes.map((String surgery) {
              return DropdownMenuItem<String>(
                value: surgery,
                child: Text(surgery),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSurgery = value;
              });
              _saveData('selectedSurgery', value!);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(labelText: 'Surgeon Name'),
            onChanged: (value) {
              setState(() {
                surgeonNameController.text = value;
              });
              _saveData('surgeonName', value);
            },
            controller: surgeonNameController,
          ),
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
