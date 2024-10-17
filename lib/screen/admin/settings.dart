import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/main.dart';
import 'package:hackathon_lintramax/screen/login.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Controller for the text field
  TextEditingController _incomePerKGController = TextEditingController();
  TextEditingController _monthlyGoalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text field with the current value of incomePerKG
    _incomePerKGController.text = incomePerKG.toString();
    _monthlyGoalController.text = monthlyGoal.toString();
  }

  // Function to update the incomePerKG value
  void _updateIncomePerKG() {
    setState(() {
      // Convert the input to an integer and update incomePerKG
      incomePerKG = int.tryParse(_incomePerKGController.text) ?? incomePerKG;
      monthlyGoal = int.tryParse(_monthlyGoalController.text) ?? monthlyGoal;
    });

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income Per KG:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _incomePerKGController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter new income per KG',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Monthly goal:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _monthlyGoalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter new income per KG',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateIncomePerKG,
              child: Text('Save'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()))
                    },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
