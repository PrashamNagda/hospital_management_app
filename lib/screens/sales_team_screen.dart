import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../blocs/sales_team_bloc/sales_team_bloc.dart';
import '../blocs/sales_team_bloc/sales_team_event.dart';

class SalesTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Team'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => SalesTeamBloc(),
        child: SalesTeamForm(),
      ),
    );
  }
}

class SalesTeamForm extends StatefulWidget {
  @override
  _SalesTeamFormState createState() => _SalesTeamFormState();
}

class _SalesTeamFormState extends State<SalesTeamForm> {
  String? selectedTransportMode;
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController surgeonNameController = TextEditingController();
  TextEditingController travelAmountController = TextEditingController();
  TextEditingController foodAmountController = TextEditingController();

  File? _travelReceiptPhoto;
  File? _foodReceiptPhoto;

  final List<String> transportModes = [
    'Car',
    'Bike',
    'Public Transport',
    'Other'
  ];

  final ImagePicker _picker = ImagePicker();

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
      surgeonNameController.text = prefs.getString('surgeonName') ?? '';
      travelAmountController.text = prefs.getString('travelAmount') ?? '';
      foodAmountController.text = prefs.getString('foodAmount') ?? '';
      selectedTransportMode = prefs.getString('selectedTransportMode');
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Method to show bottom sheet for image selection
  void _showImageSourceSelection(String type) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(type, ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Pick from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(type, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to pick an image
  Future<void> _pickImage(String type, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (type == 'travel') {
          _travelReceiptPhoto = File(pickedFile.path);
        } else if (type == 'food') {
          _foodReceiptPhoto = File(pickedFile.path);
        }
      });
    }
  }

  @override
  void dispose() {
    hospitalNameController.dispose();
    surgeonNameController.dispose();
    travelAmountController.dispose();
    foodAmountController.dispose();
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
              labelText: 'Hospital/Clinic Visited',
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

          // Surgeon Name
          TextField(
            decoration: const InputDecoration(
              labelText: 'Surgeon Name',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              setState(() {
                surgeonNameController.text = value;
              });
              _saveData('surgeonName', value);
            },
            controller: surgeonNameController,
          ),
          const SizedBox(height: 16),

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

          // Travel Amount
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Travel Amount',
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
                  _showImageSourceSelection('travel');
                },
              ),
            ],
          ),
          if (_travelReceiptPhoto != null) ...[
            SizedBox(height: 10),
            Image.file(_travelReceiptPhoto!, height: 100),
          ],
          const SizedBox(height: 16),

          // Lunch/Dinner Amount
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
                  _showImageSourceSelection('food');
                },
              ),
            ],
          ),
          if (_foodReceiptPhoto != null) ...[
            SizedBox(height: 10),
            Image.file(_foodReceiptPhoto!, height: 100),
          ],
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
    final bloc = BlocProvider.of<SalesTeamBloc>(context);

    bloc.add(HospitalNameChanged(hospitalNameController.text));
    bloc.add(SurgeonNameChanged(surgeonNameController.text));
    bloc.add(TransportModeChanged(selectedTransportMode!));
    bloc.add(TravelAmountChanged(travelAmountController.text));
    bloc.add(FoodAmountChanged(foodAmountController.text));

    // Optionally, you can navigate to another screen or show a confirmation message here
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Form Submitted')),
    // );
  }
}
