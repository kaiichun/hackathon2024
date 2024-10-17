import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/user.dart';

class EmployeeSettingsPage extends StatefulWidget {
  final UserModel user;

  const EmployeeSettingsPage({Key? key, required this.user}) : super(key: key);

  @override
  _EmployeeSettingsState createState() => _EmployeeSettingsState();
}

class _EmployeeSettingsState extends State<EmployeeSettingsPage> {
  final Map<String, Map<String, dynamic>> fakeData = {
    'Sugarcane': {
      'name': "Sugarcane",
      'cost': 200,
      'goal': 30,
      'reward': 20,
      'profit': true,
    },
    'Palm oil': {
      'name': "Palm oil",
      'cost': 300,
      'goal': 20,
      'reward': 25,
      'profit': false,
    },
    'Rice': {
      'name': "Rice",
      'cost': 100,
      'goal': 10,
      'reward': 5,
      'profit': true,
    },
    "Onion": {
      'name': "Onion",
      'cost': 250,
      'goal': 10,
      'reward': 15,
      'profit': false,
    },
    "Tomato": {
      'name': "Tomato",
      'cost': 100,
      'goal': 10,
      'reward': 15,
      'profit': true,
    }
  };

  String selectedItem = '';
  double currentIncentive = 3.5;

  @override
  void initState() {
    super.initState();
    selectedItem =
        widget.user.cropType; // Initialize with the user's current crop type
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the content horizontally
          children: [
            // User name
            Center(
              child: Text(
                '${widget.user.name}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 30),
            // Dropdown and TextField in a Row
            Row(
              children: [
                // Expand the Dropdown to take available space
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedItem, // Currently selected item
                    onChanged: (newValue) {
                      setState(() {
                        selectedItem = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select crop',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Brighter label color
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    items: fakeData.keys.map((String crop) {
                      return DropdownMenuItem<String>(
                        value: crop,
                        child: Text(crop),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16), // Spacing between Dropdown and TextField
                // Disabled TextField displaying the cost
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: "RM ${fakeData[selectedItem]?['cost']}",
                    ),
                    decoration: InputDecoration(
                      labelText: 'Cost',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Brighter label color
                      // Brighter label color
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    style: TextStyle(
                      color:
                          Colors.black.withOpacity(0.7), // Brighter text color
                    ),

                    enabled: false, // Disables the TextField
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                // Expand the Dropdown to take available space
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: "${fakeData[selectedItem]?['goal']} kg",
                    ),
                    decoration: InputDecoration(
                      labelText: 'Daily quota',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Brighter label color
                      // Brighter label color
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    style: TextStyle(
                      color:
                          Colors.black.withOpacity(0.7), // Brighter text color
                    ),

                    enabled: false, // Disables the TextField
                  ),
                ),
                SizedBox(width: 16), // Spacing between Dropdown and TextField
                // Disabled TextField displaying the cost
                Expanded(
                  child: TextField(
                    controller: TextEditingController(
                      text: fakeData[selectedItem]?['reward'].toString(),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Petty',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(
                              255, 0, 0, 0)), // Brighter label color
                      // Brighter label color
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    style: TextStyle(
                      color:
                          Colors.black.withOpacity(0.7), // Brighter text color
                    ),

                    enabled: false, // Disables the TextField
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment:
                      Alignment.centerLeft, // Aligns the text to the left
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0), // Adds padding to the left
                    child: Text("Incentive: ${currentIncentive.toString()}"),
                  ),
                ),
                Slider(
                  value: currentIncentive,
                  min: 0.0,
                  max: 10.0,
                  divisions: 40, // This ensures the steps of 0.5
                  label: currentIncentive.toString(),
                  onChanged: (value) {
                    setState(() {
                      currentIncentive = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Return the updated settings when the user clicks save
                Navigator.pop(
                  context,
                  {
                    'goal': fakeData[selectedItem]?['goal'],
                    'name': selectedItem,
                    'incentive': currentIncentive
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: fakeData[selectedItem]?['profit']
                    ? const Color.fromARGB(255, 119, 237, 45)
                    : const Color.fromARGB(255, 201, 37,
                        8), // Set the background color based on 'profit'
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
