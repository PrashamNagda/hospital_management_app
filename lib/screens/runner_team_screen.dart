import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../blocs/runner_team_bloc.dart';
import '../../blocs/runner_team_event.dart';
import '../../blocs/runner_team_state.dart';
import 'dart:io';

class RunnerTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Runner Team Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => RunnerTeamBloc(),
        child: RunnerTeamForm(),
      ),
    );
  }
}

class RunnerTeamForm extends StatefulWidget {
  @override
  _RunnerTeamFormState createState() => _RunnerTeamFormState();
}

class _RunnerTeamFormState extends State<RunnerTeamForm> {
  String? selectedTransportMode;
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController travelAmountController = TextEditingController();
  TextEditingController foodAmountController = TextEditingController();
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();
  String? photoOfItemsPath;
  String? photoOfChallanPath;
  final ImagePicker _picker = ImagePicker();

  final List<String> transportModes = [
    'Car',
    'Bike',
    'Public Transport',
    'Other'
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
      hospitalNameController.text = prefs.getString('hospitalName') ?? '';
      travelAmountController.text = prefs.getString('travelAmount') ?? '';
      foodAmountController.text = prefs.getString('foodAmount') ?? '';
      fromLocationController.text = prefs.getString('fromLocation') ?? '';
      toLocationController.text = prefs.getString('toLocation') ?? '';
      selectedTransportMode = prefs.getString('selectedTransportMode');
      photoOfItemsPath = prefs.getString('photoOfItemsPath');
      photoOfChallanPath = prefs.getString('photoOfChallanPath');
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Function to handle image selection
  Future<void> _pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        if (type == 'items') {
          photoOfItemsPath = image.path;
        } else if (type == 'challan') {
          photoOfChallanPath = image.path;
        }
      });
      _saveData(type == 'items' ? 'photoOfItemsPath' : 'photoOfChallanPath',
          image.path);
    }
  }

  @override
  void dispose() {
    hospitalNameController.dispose();
    travelAmountController.dispose();
    foodAmountController.dispose();
    fromLocationController.dispose();
    toLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Hospital Visited
          TextField(
            decoration: const InputDecoration(
              labelText: 'Hospital Visited',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              setState(() {
                hospitalNameController.text = value;
              });
              _saveData('hospitalName', value);
            },
            controller: hospitalNameController,
          ),
          const SizedBox(height: 16),

          // Photo of Items Delivered/Picked
          Row(
            children: [
              Expanded(
                child: Text(
                  'Photo of Items Delivered/Picked',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () => _pickImage('items'),
                child: const Text('Upload Photo'),
              ),
            ],
          ),
          if (photoOfItemsPath != null) ...[
            Image.file(File(photoOfItemsPath!)),
            const SizedBox(height: 16),
          ],

          // Photo of Challan
          Row(
            children: [
              Expanded(
                child: Text(
                  'Photo of Challan',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () => _pickImage('challan'),
                child: const Text('Upload Photo'),
              ),
            ],
          ),
          if (photoOfChallanPath != null) ...[
            Image.file(File(photoOfChallanPath!)),
            const SizedBox(height: 16),
          ],

          // Expenses Section
          const Text('Expenses',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // Travelling
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Mode of Transport',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
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
                  decoration: const InputDecoration(
                    labelText: 'From',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
                  decoration: const InputDecoration(
                    labelText: 'To',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
          const SizedBox(height: 16),

          // Lunch/Dinner
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Lunch/Dinner Amount',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
          const SizedBox(height: 16),

          // Submit Button
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              _submitForm(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  // Submit form data and handle business logic
  void _submitForm(BuildContext context) {
    final bloc = BlocProvider.of<RunnerTeamBloc>(context);

    bloc.add(HospitalNameChanged(hospitalNameController.text));
    bloc.add(TransportModeChanged(selectedTransportMode!));
    bloc.add(TravelFromChanged(fromLocationController.text));
    bloc.add(TravelToChanged(toLocationController.text));
    bloc.add(TravelAmountChanged(travelAmountController.text));
    bloc.add(FoodAmountChanged(foodAmountController.text));
    bloc.add(PhotoOfItemsChanged(photoOfItemsPath ?? ''));
    bloc.add(PhotoOfChallanChanged(photoOfChallanPath ?? ''));

    // Optionally, you can navigate to another screen or show a confirmation message here
    //ScaffoldMessenger.of(context).show
    //ScaffoldMessenger.of(context).showSnackBar(
    //  const SnackBar(content: Text('Form Submitted')),
    //);
  }
}
