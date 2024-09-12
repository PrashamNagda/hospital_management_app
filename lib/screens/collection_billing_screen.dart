import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../blocs/collection_billing_bloc.dart';
import '../../blocs/collection_billing_event.dart';
import '../../blocs/collection_billing_state.dart';

class CollectionBillingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection & Billing Team'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => CollectionBillingBloc(),
        child: CollectionBillingForm(),
      ),
    );
  }
}

class CollectionBillingForm extends StatefulWidget {
  @override
  _CollectionBillingFormState createState() => _CollectionBillingFormState();
}

class _CollectionBillingFormState extends State<CollectionBillingForm> {
  String? selectedCollectionMethod;
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController amountCollectedController = TextEditingController();
  TextEditingController noteRemarkController = TextEditingController();
  TextEditingController billingDetailsController = TextEditingController();
  String? selectedTransportMode;
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();
  TextEditingController travelAmountController = TextEditingController();
  TextEditingController foodAmountController = TextEditingController();

  final List<String> collectionMethods = ['CASH', 'CHEQUE'];
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
      selectedCollectionMethod = prefs.getString('selectedCollectionMethod');
      hospitalNameController.text = prefs.getString('hospitalName') ?? '';
      amountCollectedController.text = prefs.getString('amountCollected') ?? '';
      noteRemarkController.text = prefs.getString('noteRemark') ?? '';
      billingDetailsController.text = prefs.getString('billingDetails') ?? '';
      selectedTransportMode = prefs.getString('selectedTransportMode');
      fromLocationController.text = prefs.getString('fromLocation') ?? '';
      toLocationController.text = prefs.getString('toLocation') ?? '';
      travelAmountController.text = prefs.getString('travelAmount') ?? '';
      foodAmountController.text = prefs.getString('foodAmount') ?? '';
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  void dispose() {
    hospitalNameController.dispose();
    amountCollectedController.dispose();
    noteRemarkController.dispose();
    billingDetailsController.dispose();
    fromLocationController.dispose();
    toLocationController.dispose();
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

          // Collection Method Dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Collection Method',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            value: selectedCollectionMethod,
            items: collectionMethods.map((String method) {
              return DropdownMenuItem<String>(
                value: method,
                child: Text(method),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCollectionMethod = value;
              });
              _saveData('selectedCollectionMethod', value!);
            },
          ),
          const SizedBox(height: 16),

          // Cheque Photo (if applicable)
          if (selectedCollectionMethod == 'CHEQUE')
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Cheque Photo',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle photo upload for cheque
                  },
                  child: const Text('Upload Photo'),
                ),
              ],
            ),
          const SizedBox(height: 16),

          // Amount for Cash Collected
          TextField(
            decoration: const InputDecoration(
              labelText: 'Amount for Cash Collected',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              setState(() {
                amountCollectedController.text = value;
              });
              _saveData('amountCollected', value);
            },
            controller: amountCollectedController,
          ),
          const SizedBox(height: 16),

          // Note/Remark
          TextField(
            decoration: const InputDecoration(
              labelText: 'Note/Remark',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              setState(() {
                noteRemarkController.text = value;
              });
              _saveData('noteRemark', value);
            },
            controller: noteRemarkController,
          ),
          const SizedBox(height: 16),

          // Billing Details
          TextField(
            decoration: const InputDecoration(
              labelText: 'Billing Details',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onChanged: (value) {
              setState(() {
                billingDetailsController.text = value;
              });
              _saveData('billingDetails', value);
            },
            controller: billingDetailsController,
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
    final bloc = BlocProvider.of<CollectionBillingBloc>(context);

    bloc.add(HospitalNameChanged(hospitalNameController.text));
    bloc.add(CollectionMethodChanged(selectedCollectionMethod!));
    bloc.add(AmountCollectedChanged(amountCollectedController.text));
    bloc.add(NoteRemarkChanged(noteRemarkController.text));
    bloc.add(BillingDetailsChanged(billingDetailsController.text));
    bloc.add(TransportModeChanged(selectedTransportMode!));
    bloc.add(TravelFromChanged(fromLocationController.text));
    bloc.add(TravelToChanged(toLocationController.text));
    bloc.add(TravelAmountChanged(travelAmountController.text));
    bloc.add(FoodAmountChanged(foodAmountController.text));

    // Optionally, you can navigate to another screen or show a confirmation message here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form Submitted')),
    );
  }
}
