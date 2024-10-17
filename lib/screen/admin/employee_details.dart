import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/main.dart';
import 'package:hackathon_lintramax/model/log_model.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:hackathon_lintramax/screen/admin/add_log.dart';
import 'package:hackathon_lintramax/screen/admin/employee_settings.dart';
import 'package:intl/intl.dart';

class UserDetailPage extends StatefulWidget {
  final UserModel user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late List<Log> logs;

  double income = 0.0;

  @override
  void initState() {
    super.initState();
    logs = fakeLogs[widget.user.uid] ?? [];
    countIncome();
  }

  void _navigateAndAddLog(BuildContext context) async {
    final newLog = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddLogPage(
          user: widget.user,
        ),
      ),
    );

    if (newLog != null) {
      setState(() {
        logs.add(newLog);
        countIncome();
      });
    }
  }

  void _navigateToSettings(BuildContext context) async {
    // Navigate to the settings page and await the returned settings
    final newSettings = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeSettingsPage(user: widget.user),
      ),
    );

    if (newSettings != null) {
      // Update the user object with the new settings
      setState(() {
        widget.user.curGoal = newSettings['goal'];
        widget.user.cropType = newSettings['name'];
        widget.user.incentive = newSettings['incentive'];
      });
    }
  }

  void countIncome() {
    income = 0.0;
    for (Log log in logs) {
      income += log.weight * incomePerKG;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${widget.user.name}',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Aligns the text to center
              children: [
                Text(
                  'Current income: $income || Incentive: ${widget.user.incentive}%',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Center-aligns the text
                ),
                SizedBox(height: 4), // Adds a small space between the rows
                Text(
                  'Crop assigned: ${widget.user.cropType} || Daily goal: ${widget.user.curGoal}',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Center-aligns the text
                ),
              ],
            ),
          ),

          const SizedBox(
              height: 16), // Add some space between the income and buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.all(16.0), // Adjust the padding as needed
                  ),
                  onPressed: () => _navigateAndAddLog(context),
                  child: Icon(Icons.add), // Only icon without any label
                ),

                const SizedBox(width: 16), // Add space between the two buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.all(16.0), // Adjust the padding as needed
                  ),
                  onPressed: () => _navigateToSettings(context),
                  child: Icon(Icons.settings), // Only icon without any label
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0), // Vertical margin
                    decoration: BoxDecoration(
                      color: log.goalAchieved
                          ? const Color.fromARGB(255, 119, 237, 45)
                          : const Color.fromARGB(
                              255, 201, 37, 8), // Background color
                      borderRadius:
                          BorderRadius.circular(12.0), // Rounded corners
                    ),
                    child: ListTile(
                      title: Text(
                        DateFormat('MM/dd/yyyy').format(log.date),
                      ),
                      subtitle: Text(
                        "Hours: ${log.hours} || Weight: ${log.weight.toString()} kg || ${log.cropType}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
