import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/log_model.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:intl/intl.dart';

class AddLogPage extends StatefulWidget {
  final UserModel user;

  const AddLogPage({Key? key, required this.user}) : super(key: key);

  @override
  _AddLogPageState createState() => _AddLogPageState();
}

class _AddLogPageState extends State<AddLogPage> {
  DateTime? _selectedDate;
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  // Function to select a date
  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Function to save the log and return it to the previous page
  void _saveLog() {
    _selectedDate ??= DateTime.now();
    if (_selectedDate != null &&
        _hoursController.text.isNotEmpty &&
        _weightController.text.isNotEmpty) {
      final newLog = Log(
        date: _selectedDate!,
        hours: double.parse(_hoursController.text),
        weight: double.parse(_weightController.text),
        goalAchieved:
            double.parse(_weightController.text) > widget.user.curGoal,
        cropType: widget.user.cropType,
      );

      Navigator.pop(context, newLog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Log'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : 'Selected Date: ${DateFormat('MM/dd/yyyy').format(_selectedDate!)}',
              ),
            ),
            TextField(
              controller: _hoursController,
              decoration: InputDecoration(labelText: 'Hours Worked'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _saveLog,
              child: Text('Save Log'),
            ),
          ],
        ),
      ),
    );
  }
}
